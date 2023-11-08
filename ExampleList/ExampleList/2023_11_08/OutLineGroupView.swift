//
//  OutLineGroup.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI

struct CarInfo: Identifiable {
    let id = UUID()
    var name: String
    var image: String
    var children: [CarInfo]?
}

let carItems: [CarInfo] = [
    
    CarInfo(name: "Hybrid Cars", image: "leaf.fill", children: [
        CarInfo(name: "Toyota", image: "car.circle", children : [
            CarInfo(name: "Prius", image: "leaf.fill"),
            CarInfo(name: "Highlander Hybrid", image: "leaf.fill"),
            CarInfo(name: "Lexus", image: "car.circle", children: [
                CarInfo(name: "Lexus RX", image: "leaf.fill"),
                CarInfo(name: "Lexus NX", image: "leaf.fill")])
        ]),
        CarInfo(name: "Ford", image: "car.circle", children : [
            CarInfo(name: "Fusion Energi", image: "leaf.fill"),
            CarInfo(name: "Escape", image: "leaf.fill"),
            CarInfo(name: "Volvo", image: "car.circle", children: [
                CarInfo(name: "S90 Hybrid", image: "leaf.fill"),
                CarInfo(name: "XC90 Hybrid", image: "leaf.fill")])
        ]),
    ]),
    
    CarInfo(name: "Electric Cars", image: "bolt.car.fill", children: [
        CarInfo(name: "Tesla", image: "car.circle", children : [
            CarInfo(name: "Model 3", image: "bolt.car.fill")
        ]),
        CarInfo(name: "Karma", image: "car.circle", children : [
            CarInfo(name: "Revero GT", image: "bolt.car.fill")
        ])
    ])
]

struct OutLineGroupView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .font(.custom("NotoSansKR-Bold", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                })
                Spacer()
                
            }
            .padding(.horizontal, 20)
            
            List {
                ForEach(carItems) { carItem in
                    Section(header: Text(carItem.name)) {
                        //데이터를 화면에 표현하는 것에 더 큰 제어 기능을 제공
                        //Section dmfh 구분하여 표시
                        //List 뷰에 포함하면 시각적으로 더 만족스러움이 가능
                        OutlineGroup(carItem.children ?? [CarInfo](), children: \.children) { children in
                            CarCellView(item: children)
                        }
                    }
                }
            }
            .listStyle(InsetListStyle())
            
            
            /*
             List(carItems, children: \.children) { item in
                HStack {
                    Image(systemName: item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.green)
                        .padding(.horizontal)
                 
                    Text(item.name)
                        .modifier(StandardCustomSimpleText())
                }
             }
             */
        }
        .navigationBarBackButtonHidden()
    }
}

struct CarCellView: View {
    var item: CarInfo
    
    var body: some View {
        HStack {
            Image(systemName: item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundStyle(.green)
                .padding(.horizontal)
         
            Text(item.name)
                .modifier(StandardCustomSimpleText())
        }
    }
}

#Preview {
    OutLineGroupView()
}
