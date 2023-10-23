//
//  Variousfunction.swift
//  ExampleList
//
//  Created by 노주영 on 2023/10/23.
//

import SwiftUI

struct Variousfunction: View {
    
    var colors: [Color] = [.black, .red, .green, .blue, .yellow, .cyan]
    var colorNames: [String] = ["Black", "Red", "Green", "Blue", "Yellow", "Cyan"]
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Hello, world!"
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .font(.custom("MaplestoryOTFLight", size: 25))
                        .foregroundStyle(rotation > 180 ? .white : colors[colorIndex])
                        .bold()
                    
                })
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Spacer()
            VStack{
                Spacer()
                Text(text)
                    .foregroundColor(rotation > 180 ? .white : colors[colorIndex])
                    .font(.custom("MaplestoryOTFBold", size: 40))
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeInOut(duration: 3), value: rotation)
                    .padding()
                
                Picker(selection: $colorIndex, label: Text("Color")){
                    ForEach(0..<colorNames.count, id: \.self) {
                        Text(colorNames[$0])
                            .font(.custom("MaplestoryOTFBold", size: 40))
                            .foregroundStyle(colors[$0])
                    }
                }
                .background(rotation < 180 ? .gray : .white)
                .animation(.easeInOut(duration: 3), value: rotation)
                .opacity(1)
                .cornerRadius(30)
                .pickerStyle(.wheel)
                .padding()
                
                
                Spacer()
                Spacer()
                TextField("Enter text here", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(colors[colorIndex])
                    .modifier(StandardCustomFontTitle())
                    .padding()
                
                Slider(value: $rotation, in: 0...360, step: 0.1)
                    .tint(rotation > 180 ? .white : colors[colorIndex])
                    .padding()
            }
        }
        .background(Image("nightGlass")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(rotation/360)
        .ignoresSafeArea())
        .navigationBarBackButtonHidden()
    }
}


#Preview {
    Variousfunction()
}
