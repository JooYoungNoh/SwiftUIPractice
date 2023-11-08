//
//  GroupPractice.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI

struct GroupOneModel: Identifiable {
    let id = UUID()
    var title: String
    var children: [GroupOneModel]?
    
}

struct MenuItem: Identifiable {
    let id = UUID()
    var title: String
    var price: Int
    var children: [MenuItem]?
}

let sampleOne = [
    GroupOneModel(title: "A", children: [
        GroupOneModel(title: "B"),
        GroupOneModel(title: "C", children: [
            GroupOneModel(title: "D"),
            GroupOneModel(title: "E")
        ])
    ]),
    GroupOneModel(title: "F")
]

let sampleTwo = [
    MenuItem(title: "Burger", price: 6000),
    MenuItem(title: "Pizza", price: 8000, children: [
        MenuItem(title: "Cheese", price: 8000),
        MenuItem(title: "Pepperoni", price: 9000),
        MenuItem(title: "Veggie", price: 10000)
        ]),
    MenuItem(title: "Salad", price: 3000)
]

struct GroupPractice: View {
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
                ForEach(sampleOne) { sample in
                    OutlineGroup(sample, children: \.children) { children in
                        Text(children.title)
                            .modifier(StandardCustomSimpleText())
                    }
                }
            }
            .listStyle(InsetListStyle())
            .padding(.bottom, 20)
            
            List {
                ForEach(sampleTwo) { sample in
                    OutlineGroup(sample, children: \.children) { children in
                        HStack {
                            Text(children.title)
                                .frame(width: 100, height: 40, alignment: .leading)
                                .modifier(StandardCustomSimpleText())
                                .padding(.trailing, 10)
                            Text("\(children.price)")
                                .modifier(StandardCustomSimpleText())
                        }
                    }
                }
            }
            .listStyle(InsetListStyle())
            .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GroupPractice()
}
