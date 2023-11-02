//
//  ListNaviDetail.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct ListNaviDetail: View {
    @Environment(\.dismiss) private var dismiss
    
    let selectedCar: Car
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .font(.custom("NotoSansKR-Regular", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                })
                Spacer()
                
            }
            .padding(.horizontal, 20)
            
            Form {
                Section {
                    Image(selectedCar.imageName)
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text(selectedCar.name)
                        .font(.custom("NotoSansKR-Regular", size: 25))
                    
                    Text(selectedCar.description)
                        .font(.body)
                    
                    HStack {
                        Text("Hybrid").font(.custom("NotoSansKR-Bold", size: 30))
                        Spacer()
                        Image(systemName: selectedCar.isHybrid ?  "checkmark.circle" : "xmark.circle")
                    }
                } header: {
                    Text("Car Details")
                }
                
            }
        }
        .navigationBarBackButtonHidden()
    }
}

