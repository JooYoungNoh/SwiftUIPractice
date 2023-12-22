//
//  ChartModel.swift
//  ExampleList
//
//  Created by 노주영 on 12/22/23.
//

import Foundation

struct ChartModel: Identifiable {
    let id = UUID()
    var day: String
    var temp: Int
}

var highTemp: [ChartModel] = [
    .init(day: "오늘", temp: -6),
    .init(day: "토", temp: -1),
    .init(day: "일", temp: 2),
    .init(day: "월", temp: 3),
    .init(day: "화", temp: 6),
    .init(day: "수", temp: 5),
    .init(day: "목", temp: 4)
]

var lowTemp: [ChartModel] = [
    .init(day: "오늘", temp: -14),
    .init(day: "토", temp: -12),
    .init(day: "일", temp: -7),
    .init(day: "월", temp: -4),
    .init(day: "화", temp: -4),
    .init(day: "수", temp: -3),
    .init(day: "목", temp: -4)

]
