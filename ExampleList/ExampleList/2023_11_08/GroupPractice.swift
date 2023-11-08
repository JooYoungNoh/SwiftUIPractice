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

struct ImageItem: Identifiable {
    let id = UUID()
    var name: String
    var imageLink: String
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
    
    @State private var normalState: Bool = true
    @State private var reverseState: Bool = false
    @State private var randomState: Bool = false
    
    @State private var imageList: [ImageItem] = [
        ImageItem(name: "조유리", imageLink: "https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/nn/2021/10/12/202110121604440010_1.jpg"),
        ImageItem(name: "카리나", imageLink: "https://image.fmkorea.com/files/attach/new2/20211226/3655109/3035547727/4197422423/25d648fe733c6d47eb95160f31ed02ff.jpeg"),
        ImageItem(name: "아이유", imageLink: "https://cdn2.ppomppu.co.kr/zboard/data3/2014/0930/m_1412087358_3415783392_f0263985.jpg"),
        ImageItem(name: "윈터", imageLink: "https://upload3.inven.co.kr/upload/2022/03/15/bbs/i16485681820.jpg?MW=800")
    ]
    
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
                Section {
                    ForEach(sampleOne) { sample in
                        OutlineGroup(sample, children: \.children) { children in
                            Text(children.title)
                                .modifier(StandardCustomSimpleText())
                        }
                    }
                } header: {
                    Text("실습 1")
                        .modifier(StandardCustomSimpleText())
                }
                
                Section {
                    ForEach(sampleTwo) { sample in
                        OutlineGroup(sample, children: \.children) { children in
                            HStack {
                                Text(children.title)
                                    .frame(width: 100, height: 20, alignment: .leading)
                                    .modifier(StandardCustomSimpleText())
                                    .padding(.trailing, 10)
                                Text("\(children.price)")
                                    .modifier(StandardCustomSimpleText())
                            }
                        }
                    }
                } header: {
                    Text("실습 2")
                        .modifier(StandardCustomSimpleText())
                }
                
                Section {
                    DisclosureGroup {
                        HStack {
                            Text("Normal")
                                .modifier(StandardCustomSimpleText())
                            Spacer()
                            Button(action: {
                                imageList = [ImageItem(name: "조유리", imageLink: "https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/nn/2021/10/12/202110121604440010_1.jpg"),
                                ImageItem(name: "카리나", imageLink: "https://image.fmkorea.com/files/attach/new2/20211226/3655109/3035547727/4197422423/25d648fe733c6d47eb95160f31ed02ff.jpeg"),
                                ImageItem(name: "아이유", imageLink: "https://cdn2.ppomppu.co.kr/zboard/data3/2014/0930/m_1412087358_3415783392_f0263985.jpg"),
                                ImageItem(name: "윈터", imageLink: "https://upload3.inven.co.kr/upload/2022/03/15/bbs/i16485681820.jpg?MW=800")
                                ]
                            }, label: {
                                Text("Click")
                                    .padding(5)
                                    .bold()
                            })
                            .background(Color(uiColor: UIColor.systemGray6))
                            .cornerRadius(5)
                        }
                        
                        HStack {
                            Text("Reverse")
                                .modifier(StandardCustomSimpleText())
                            Spacer()
                            Button(action: { 
                                imageList.reverse()
                            }, label: {
                                Text("Click")
                                    .padding(5)
                                    .bold()
                            })
                            .background(Color(uiColor: UIColor.systemGray6))
                            .cornerRadius(5)
                        }
                        
                        HStack {
                            Text("Random")
                                .modifier(StandardCustomSimpleText())
                            Spacer()
                            Button(action: {
                                imageList.shuffle()
                            }, label: {
                                Text("Click")
                                    .padding(5)
                                    .bold()
                            })
                            .background(Color(uiColor: UIColor.systemGray6))
                            .cornerRadius(5)
                        }
                            
                        
                    } label: {
                        Label("Image Sort", systemImage: "photo")
                            .modifier(StandardCustomSimpleText())
                    }
                } header: {
                    Text("실습 3")
                        .modifier(StandardCustomSimpleText())
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(imageList) { i in
                            VStack {
                                AsyncImage(url: URL(string: i.imageLink)!) {
                                    image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(12.0)
                                        .frame(width: 100, height: 100)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 100, height: 100)
                                }
                                
                                Text(i.name)
                                    .modifier(StandardCustomSimpleText())
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GroupPractice()
}
