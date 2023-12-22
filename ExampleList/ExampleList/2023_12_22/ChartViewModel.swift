//
//  ChartViewModel.swift
//  ExampleList
//
//  Created by 노주영 on 12/22/23.
//

import Foundation

class ChartViewModel: ObservableObject {
    @Published var timeCount: Double = 0.0
    
    var timer: Timer?
    
    func startCount() {
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    func resetCount() {
        timeCount = 0
    }
    
    @objc func timerDidFire() {
        if timeCount < 100 {
            timeCount += 1
        }
    }
}
