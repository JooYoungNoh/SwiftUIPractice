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
            
            Text("List Quiz 1, 3, 4, 5")
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
                            .onTapGesture { _ in
                                if let index = listData.firstIndex(of: i.wrappedValue) {
                                    listData = listData.map{
                                        return ToDoItem(text: $0.text, isImage: false, isToggle: $0.isToggle)
                                    }
                                    listData[index].isImage.toggle()
                                }
                            }
                        
                        Spacer()
                        if i.wrappedValue.isImage {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 30))
                        }
                        
                        Toggle(isOn: i.isToggle) {}
                        .frame(maxWidth: 50, maxHeight: 30)
                        
                        Button(action: {}) {
                            Text("삭제")
                                .padding()
                                .font(.custom("MaplestoryOTFLight", size: 10))
                                .foregroundColor(.white)
                                
                        }
                        .onTapGesture {
                            if let index = listData.firstIndex(of: i.wrappedValue) {
                                listData.remove(at: index)
                                print("wqweqwe")
                            }
                        }
                        .frame(maxWidth: 50)
                        .background(.red)
                        .cornerRadius(10)
                        .padding(.leading, 10)
                    }
                    .frame(maxWidth: .infinity)
                }
                .onDelete(perform: { indexSet in
                    listData.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    listData.move(fromOffsets: indices, toOffset: newOffset)
                })
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
