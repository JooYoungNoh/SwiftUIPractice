//
//  ApiPractice.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/30.
//

import SwiftUI

struct ApiPractice: View {
    
    @StateObject var viewModel: ApiPracticeVM = ApiPracticeVM()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(viewModel.weather?.weather[0].icon ?? "")@2x.png")) {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12.0)
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
            } placeholder: {
                ProgressView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
            }
            
            if viewModel.weather?.name == "" {
                Text("지역 확인 불가")
                    .padding()
                    .font(.system(size: 30))
                    .bold()
                    .background(.white)
            } else {
                Text("\(viewModel.weather?.name ?? "")")
                    .font(.system(size: 30))
                    .bold()
            }
            
            HStack(alignment: .top) {
                Text("\(changeF(viewModel.weather?.main.temp ?? 32))")
                    .padding()
                    .font(.system(size: 50))
                    .bold()
                    .background(.white)
                
                Image(systemName: "circlebadge")
                    .font(.system(size: 25))
                    .padding(.leading, -20)
                    .padding(.top, 25)
            }
            
            Text("\(viewModel.weather?.weather[0].main ?? "")")
                .font(.system(size: 20))
                .bold()
            
            Text("\(viewModel.weather?.weather[0].description ?? "")")
                .font(.system(size: 15))
            
            HStack() {
                Text("최고: \(changeF(viewModel.weather?.main.temp_max ?? 32))")
                    .font(.system(size: 20))
                    .bold()
                Image(systemName: "circlebadge")
                    .font(.system(size: 7))
                    .padding(.leading, -7)
                    .padding(.top, -7)
                
                Text("최저: \(changeF(viewModel.weather?.main.temp_max ?? 32))")
                    .font(.system(size: 20))
                    .bold()
                Image(systemName: "circlebadge")
                    .font(.system(size: 7))
                    .padding(.leading, -7)
                    .padding(.top, -7)
            }
            .padding()
            
            HStack() {
                Text("\(changeDeg(viewModel.weather?.wind.deg ?? 0))")
                    .font(.system(size: 20))
                    .bold()
                
                Text("풍속: \(String(format: "%.1f", viewModel.weather?.wind.speed ?? 0))m/s")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading)
            }
            .padding()
            
            Spacer()
            
            Button {
                viewModel.feachData()
            } label: {
                Text("랜덤 찾기")
                    .bold()
                    .frame(width: UIScreen.main.bounds.width/2, height: 50)
                    .background(
                        
                    )
            }

        }
        .padding()
        .onAppear {
            viewModel.feachData()
        }
    }
    
    //1.8*C + 32 = F
    func changeF(_ number: Double) -> String {
        return String(format: "%.1f", number - 273.15)
    }
    
    func changeDeg(_ number: Int) -> String{
        if number >= 23 && number <= 67 {
            return "북동풍"
        } else if number >= 68 && number <= 112 {
            return "동풍"
        } else if number >= 113 && number <= 157 {
            return "남동풍"
        } else if number >= 158 && number <= 202 {
            return "남풍"
        } else if number >= 203 && number <= 247 {
            return "남서풍"
        } else if number >= 248 && number <= 292 {
            return "서풍"
        } else if number >= 293 && number <= 337 {
            return "북서풍"
        } else {
            return "북풍"
        }
    }
}
