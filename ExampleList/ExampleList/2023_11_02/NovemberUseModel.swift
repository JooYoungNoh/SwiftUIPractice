//
//  NovemberUseModel.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/02.
//

import Foundation

//자동차 모델 2023_11_02
struct Car: Codable {
    var id: String
    var name: String
    var description: String
    var isHybrid: Bool
    var imageName: String
}
