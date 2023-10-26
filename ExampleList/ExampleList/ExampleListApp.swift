//
//  ExampleListApp.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/20.
//

/* 앱의 상태 5가지

NotRunning:     앱이 실행되지 않는 상태
Active:         앱이 실행 중인 상태 그러나 아무런 이벤트를 받지 않는 상태
Inactive:       앱이 실행 중이며 이벤트가 발생한 상태
Background:     앱이 백그라운드에 있는 상태 그러나 실행되는 코드가 있는 상태
Suspend:        앱이 백그라운드에 있고 실행되는 코드가 없는 상태(수면상태)

*/

import SwiftUI

@main
struct ExampleListApp: App {
    //현재 화면의 상태를 저장하기
    @Environment(\.scenePhase) private var scencePhase
    
    var body: some Scene {
        WindowGroup {
            ExampleList()
        }
        .onChange(of: scencePhase){ phase in
            switch phase {
            case .active:
                print("Active")
            case .inactive:
                print("Inactive")
            case .background:
                print("Background")
            default:
                print("Unknown scenephase")
            }
        }
    }
}
