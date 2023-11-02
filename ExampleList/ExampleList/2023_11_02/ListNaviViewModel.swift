//
//  ListNaviViewModel.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/02.
//

import Foundation

class ListNaviViewModel: ObservableObject {
    @Published var cars: [Car] = []
    
    //JSON 파일 로드하기
    func loadJson<T: Decodable>(_ filename: String) async -> T {
        var data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("파일을 찾을 수 없습니다")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("데이터 변환에 실패했습니다")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("파싱에 실패했습니다")
        }
    }
}
