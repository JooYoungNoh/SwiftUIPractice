//
//  ApiPracticeModel.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/30.
//

import Foundation
import SwiftUI

struct WeatherInfoModel: Decodable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

struct Weather: Decodable {
    let id: Int
    let main, description, icon: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}
