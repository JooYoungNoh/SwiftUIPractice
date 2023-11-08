//
//  NaviSplitTwo.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI

struct Item2: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var content: String
}

struct NaviSplitTwo: View {
    // 샘플 데이터
    @State private var items = [
        Item2(title: "첫 번째 항목", content: "이것은 첫 번째 항목입니다."),
        Item2(title: "두 번째 항목", content: "이것은 두 번째 항목입니다."),
        Item2(title: "세 번째 항목", content: "이것은 세 번째 항목입니다."),
        Item2(title: "네 번째 항목", content: "이것은 네 번째 항목입니다."),
        Item2(title: "다섯 번째 항목", content: "이것은 다섯 번째 항목입니다."),
        Item2(title: "여섯 번째 항목", content: "이것은 여섯 번째 항목입니다."),
        Item2(title: "일곱 번째 항목", content: "이것은 일곱 번째 항목입니다."),
        Item2(title: "여덟 번째 항목", content: "이것은 여덟 번째 항목입니다."),
        Item2(title: "아홉 번째 항목", content: "이것은 아홉 번째 항목입니다."),
        Item2(title: "열 번째 항목", content: "이것은 열 번째 항목입니다.")
    ]
    
    @State private var selectedItem: Item2?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            ListView(selectedItem: $selectedItem, items2: items)
        } detail: {
            DetailView(selectedItem: $selectedItem)
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct ListView: View {
    @Binding var selectedItem: Item2?
    var items2: [Item2]
    
    var body: some View {
        List(items2, selection: $selectedItem) { item in
            Text(item.title).tag(item)
        }
    }
}

struct DetailView: View {
    @Binding var selectedItem: Item2?
    
    var body: some View {
        VStack {
            if let selectedItem {
                HStack {
                    VStack(alignment: .leading){
                        Text(selectedItem.title)
                            .modifier(StandardCustomSimpleTitle())
                            .padding()
                        
                        Text(selectedItem.content)
                            .modifier(StandardCustomSimpleText())
                            .padding()
                        
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.horizontal)
            } else {
                Text("Select a Item")
                    .modifier(StandardCustomSimpleTitle())
            }
        }
    }
}

#Preview {
    NaviSplitTwo()
}
