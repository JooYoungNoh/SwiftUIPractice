//
//  GroupPractice.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI

struct GroupOneModel: Identifiable{
    let id = UUID()
    var title: String
    var children: [GroupOneModel]?
    
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
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GroupPractice()
}
