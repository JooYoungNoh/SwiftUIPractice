//
//  ApiPracticeVM.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/30.
//

import Foundation

class ApiPracticeVM: ObservableObject {
    @Published var weather: WeatherInfoModel?
    
    private let location: [Int] = Array(-90...90)
    
    var apiKey: String? {
        get {
            let keyfilename = "ApiKeys"
            let api_key = "API_KEY"
            
            // 생성한 .plist 파일 경로 불러오기
            guard let filePath = Bundle.main.path(forResource: keyfilename, ofType: "plist") else {
                fatalError("Couldn't find file '\(keyfilename).plist'")
            }
            
            // .plist 파일 내용을 딕셔너리로 받아오기
            let plist = NSDictionary(contentsOfFile: filePath)
            
            // 딕셔너리에서 키 찾기
            guard let value = plist?.object(forKey: api_key) as? String else {
                fatalError("Couldn't find key '\(api_key)'")
            }
            
            return value
        }
    }
    
    func feachData() {
        guard let apiKey = apiKey else { return }
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.randomElement() ?? 0)&lon=\(location.randomElement() ?? 0)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // 정상적으로 값이 오지 않았을 때 처리
                print("값 안옴")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(WeatherInfoModel.self, from: data)
                DispatchQueue.main.async {
                    self.weather = result
                    print(self.weather)
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
