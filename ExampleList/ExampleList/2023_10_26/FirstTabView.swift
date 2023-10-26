//
//  FirstTabView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/26.
//

/*
 
 - onAppear() 수정자   : 뷰가 나타날 때 실행
 - onDisapper() 수정자 : 뷰가 사라질 때 실행
 - task() 수정자       : 뷰를 만들때 비동기 작업을 시작
 
*/

import SwiftUI

struct FirstTabView: View {
    @State var title: String = "View One"
    
    var body: some View {
        VStack {
            Text(title)
                .onAppear(perform: {
                    print("onAppear triggered")
                })
                .onDisappear(perform: {
                    print("onDisappeared triggered")
                })
                .task(priority: TaskPriority.background) {
                    title = await changeTitle()
                }
        }
        .modifier(StandardCustomFontTitle())
    }
    func changeTitle() async -> String {
        sleep(5)
        return "비동기 처리 완료"
    }
}

#Preview {
    FirstTabView()
}
