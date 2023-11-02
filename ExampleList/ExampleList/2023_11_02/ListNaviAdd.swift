//
//  ListNaviAdd.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct ListNaviAdd: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var carVM: ListNaviViewModel
    
    @State private var isHybrid = false
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("Close")
                        .font(.custom("NotoSansKR-Regular", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                })
                Spacer()
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            Form {
                Section {
                    Image(systemName: "car.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    DataInput(title: "Model", userInput: $name)
                    DataInput(title: "Description", userInput: $description)
                    
                    Toggle(isOn: $isHybrid) {
                        Text("Hybrid")
                            .font(.custom("NotoSansKR-Regular", size: 25))
                    }
                    .padding()
                } header: {
                    Text("Car Details")
                        .font(.custom("NotoSansKR-Bold", size: 20))
                        .foregroundStyle(.black)
                        .bold()
                }
            }
            
            Button {
                if name != "" && description != "" {
                    addNewCar()
                } else {
                    showingAlert = true
                }
            } label: {
                Text("Add Car")
                    .padding()
                    .font(.custom("NotoSansKR-Regular", size: 25))
                    .foregroundStyle(.black)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: UIColor.systemGray4))
            .cornerRadius(5)
            .padding(.horizontal, 20)
            .alert("정보를 입력해주세요", isPresented: $showingAlert, actions: {})
        }
        .onDisappear {
            Task {
                carVM.cars = await carVM.loadJson("carData.json") + carVM.addCars
            }
        }
    }
    
    func addNewCar() {
        // 프로젝트 간략화를 위해 사진 라이브러리에서 사진을 가져오지 않고 기존 이미지를 재사용
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "tesla_model_3")
        
        carVM.addCars.append(newCar)
        dismiss()
    }
}

// 새로운 차량의 상세 정보 입력을 위한 하위 뷰를 선언
struct DataInput : View {
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("NotoSansKR-Regular", size: 25))
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle( RoundedBorderTextFieldStyle() )
        }
        .padding()
    }
}
