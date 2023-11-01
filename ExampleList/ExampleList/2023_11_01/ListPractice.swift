//
//  ListPractice.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/01.
//

import SwiftUI

struct ToDoItem : Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isImage: Bool
    var isToggle: Bool
}

struct ListPractice: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var listData: [ToDoItem] = []
    @State private var saveIndex: Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                })
                Spacer()
                
            }
            .padding(.horizontal, 20)
            
            Text("List Quiz 1, 3, 4")
                .modifier(StandardCustomFontTitle())
                .padding()
            
            List {
                ForEach($listData) { (i: Binding<ToDoItem>) in
                    HStack {
                        Text(i.wrappedValue.text)
                            .font(.custom("MaplestoryOTFLight", size: 20))
                            .foregroundColor(.blue)
                            .bold(i.wrappedValue.isToggle)
                            .padding()
                        
                        Spacer()
                        if i.wrappedValue.isImage {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 30))
                        }
                        
                        Toggle(isOn: i.isToggle) {
                            
                        }
                        .frame(maxWidth: 50, maxHeight: 30)
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture { _ in
                        listData[saveIndex].isImage = false
                        if let index = listData.firstIndex(of: i.wrappedValue) {
                            listData[index].isImage.toggle()
                            saveIndex = index
                        }
                    }
                }
            }
            .background(.white)
            .onAppear {
                for index in 1...10 {
                    listData.append(ToDoItem(text: "Item\(index)", isImage: false, isToggle: false))
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ListPractice()
}
