//
//  ListNavi.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct ListNavi: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var carVM: ListNaviViewModel = ListNaviViewModel()

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
            
            List {
                Section(content: {
                    ForEach(0..<carVM.cars.count, id: \.self) { i in
                        NavigationLink(destination: ListNaviDetail(selectedCar: carVM.cars[i]), label: {
                            ListCell(car: carVM.cars[i])
                        })
                    }
                },header: {
                    Text("Car Type")
                        .font(.custom("NotoSansKR-Bold", size: 20))
                        .foregroundStyle(.black)
                        .bold()
                })
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            Task {
                carVM.cars = await carVM.loadJson("carData.json")
            }
        }
    }
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(car.name)
                .font(.custom("NotoSansKR-Regular", size: 20))
        }
    }
}

#Preview {
    ListNavi()
}
