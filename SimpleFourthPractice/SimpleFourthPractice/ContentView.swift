//
//  ContentView.swift
//  SimpleFourthPractice
//
//  Created by 노주영 on 2023/10/13.
//

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue, .yellow, .cyan]
    var colorNames: [String] = ["Black", "Red", "Green", "Blue", "Yellow", "Cyan"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Hello, world!"
    
    var body: some View {
        VStack {
            VStack{
                Spacer()
                Text(text)
                    .modifier(StandardCustomFont())
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeInOut(duration: 3), value: rotation)
                    .foregroundColor(rotation > 180 ? .white : colors[colorIndex])
                    .padding()
                
                Picker(selection: $colorIndex, label: Text("Color")){
                    ForEach(0..<colorNames.count, id: \.self) {
                        Text(colorNames[$0])
                            .foregroundStyle(colors[$0])
                    }
                }
                .modifier(StandardCustomFont())
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
                    .modifier(StandardCustomFont())
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
    }
}

struct StandardCustomFont: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("CookieRun-Regular", size: 30))
            .fontWeight(.bold)
    }
}

#Preview {
    ContentView()
}
