//
//  AnimationDemoTwoView.swift
//  ExampleList
//
//  Created by 노주영 on 12/20/23.
//

import SwiftUI

struct AnimationDemoTwoView: View {
    @Namespace private var menuItemTransition
    
    @State var selectIndex: Int = 0
    
    let menuItems = ["Travel", "Nature", "Architecture"]
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(menuItems.indices, id: \.self) { index in
                if selectIndex == index {
                    MenuView(title: menuItems[index])
                        .background(Capsule().foregroundStyle(.purple))
                        .matchedGeometryEffect(id: "menuItem", in: menuItemTransition)
                        .onTapGesture {
                            selectIndex = index
                        }
                } else {
                    MenuView(title: menuItems[index])
                        .background(Capsule().foregroundStyle(Color(uiColor: .systemGray4)))
                        .onTapGesture {
                            selectIndex = index
                        }
                }
                Spacer()
            }
        }
        .padding()
        .animation(.easeInOut, value: selectIndex)
    }
}

struct MenuView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .foregroundStyle(.white)
    }
}

