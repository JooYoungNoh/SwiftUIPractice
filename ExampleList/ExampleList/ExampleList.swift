//
//  ExampleList.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/20.
//

import SwiftUI




struct ExampleList: View {
    private var list: [String] = ["exam1", "exam2", "exam3", "exam4"]
    private let layouts : [GridItem] = [GridItem(.flexible()) ,GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("실습 예제")
                    Spacer()
                }
                .modifier(StandardCustomFontTitle())
                .padding(.horizontal, 20)
                .padding(.top, 50)

                ScrollView {
                    VStack {
                        LazyVGrid(columns: layouts, spacing: 10, pinnedViews: [.sectionHeaders]){
                            ForEach(0..<1) { _ in
                                Section(header: Header()){
                                    if self.list.isEmpty {
                                        Button(action: {}, label: {
                                            VStack {
                                                Image(systemName: "folder.fill")
                                                    .font(.system(size: 80))
                                                    .opacity(0.5)
                                                    .foregroundColor(.red)
                                                Text("폴더가 없음..")
                                                    .lineLimit(1)
                                                    .padding(.bottom, 5)
                                            }
                                        })
                                    } else {
                                        ForEach(0..<self.list.count) { i in
                                            Button(action: {}, label: {
                                                VStack {
                                                    Image(systemName: "folder.fill")
                                                        .font(.system(size: 80))
                                                        .opacity(0.5)
                                                        .foregroundColor(.blue)
                                                    Text(self.list[i])
                                                        .lineLimit(1)
                                                        .padding(.bottom, 5)
                                                }
                                            })
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .modifier(StandardCustomFontText())
                    .background(.white)
                }
            }
        }
    }
}

//MARK: LazyVGridView
//LazyVGridHeader

struct Header: View {
    var body: some View {
        VStack {
            Text("")
                .frame(maxWidth: .infinity, maxHeight: 3)
                .padding(1)
                .background(.gray)
                .border(.gray, width: 1)
                .padding(.horizontal, 20)
        }
        .padding(.bottom, 20)
        .background(.white)
    }
}

#Preview {
    ExampleList()
}
