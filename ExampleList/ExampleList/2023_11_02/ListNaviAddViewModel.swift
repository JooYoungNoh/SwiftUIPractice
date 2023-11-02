//
//  ListNaviAddViewModel.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/02.
//

import Foundation

class ListNaviAddViewModel {
    
    func addNewCar(carVM: ListNaviViewModel, name: String, description: String, isHybrid: Bool) {
        // 프로젝트 간략화를 위해 사진 라이브러리에서 사진을 가져오지 않고 기존 이미지를 재사용
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        
        carVM.addCars.append(newCar)
    }
}
