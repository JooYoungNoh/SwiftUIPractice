//
//  ChartPracticeView.swift
//  ExampleList
//
//  Created by 노주영 on 12/22/23.
//

import SwiftUI
import Charts

struct ChartPracticeView: View {
    @StateObject var viewModel: ChartViewModel = ChartViewModel()
    
    @State private var actionText: String = "안양시 날씨 데이터 가져오는중"
    @State private var isShowProgress: Bool = false
    @State private var xOffset: CGFloat = -400
    
    let temps = [
        (channel: "최고", data: highTemp),
        (channel: "최저", data: lowTemp)
    ]
    
    var body: some View {
        ZStack {
            if isShowProgress {
                VStack {
                    HStack {
                        Text(actionText)
                            .font(.system(size: 20, weight: .semibold))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    ProgressView(value: viewModel.timeCount, total: 100)
                        .progressViewStyle(BarProgressStyle())
                        .padding(.horizontal, 20)
                }
                .padding(.top, 300)
            }
            
            VStack {
                Text("안양시 날씨")
                    .padding(10)
                    .frame(width: UIScreen.main.bounds.width - 60)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.bottom, 20)
                
                Chart {
                    ForEach(temps, id: \.channel) { channel in
                        ForEach(channel.data) { temp in
                            LineMark (
                                x: .value("Day", temp.day),
                                y: .value("Temp", temp.temp)
                            )
                            .foregroundStyle(by: .value("Channel", channel.channel))
                            .symbol(by: .value("Channel", channel.channel))
                        }
                    }
                }
                .chartXAxis {
                    AxisMarks {
                        AxisValueLabel()
                            .font(.system(size: 15))
                    }
                }
                .chartYAxis {
                    AxisMarks {
                        AxisValueLabel()
                            .font(.system(size: 15))
                    }
                }
                .padding()
                .frame(height: 380)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.bottom, 50)
            }
            .offset(x: xOffset)
            
            VStack {
                Spacer()
                Button {
                    if viewModel.timeCount > 0 {
                        withAnimation(.bouncy(duration: 1)) {
                            xOffset = -400
                            isShowProgress = true
                            viewModel.resetCount()
                        }
                    } else {
                        isShowProgress = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            viewModel.startCount()
                        }
                    }
                    
                    actionText = "안양시 날씨 데이터 가져오는중"
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        actionText += "."
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        actionText += "."
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        actionText += "."
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        isShowProgress = false
                        withAnimation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0)) {
                            xOffset = 0
                        }
                    }
                } label: {
                    Text("날씨 보기")
                        .padding(10)
                        .frame(width: UIScreen.main.bounds.width - 60)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.white)
                        .background(.skyLoading)
                        .cornerRadius(10)
                }
            }
            .padding(.bottom, 50)
        }
    }
    
    struct BarProgressStyle: ProgressViewStyle {
        var height: Double = 50
        var labelFontStyle: Font = .body
        
        func makeBody(configuration: Configuration) -> some View {
            
            let progress = configuration.fractionCompleted ?? 0.0
            
            GeometryReader { geometry in
                
                VStack(alignment: .leading) {
                    
                    configuration.label
                        .font(labelFontStyle)
                    
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color(uiColor: .systemGray5))
                        .frame(height: height)
                        .frame(width: geometry.size.width)
                        .overlay(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(.skyLoading)
                                .frame(width: geometry.size.width * progress)
                                .overlay {
                                    if Int(progress*100) > 15 {
                                        Text("\(Int(progress*100))%")
                                            .font(.system(size: 20, weight: .semibold))
                                            .foregroundColor(.white)
                                    }
                                }
                        }
                    
                }
                
            }
        }
    }
}
