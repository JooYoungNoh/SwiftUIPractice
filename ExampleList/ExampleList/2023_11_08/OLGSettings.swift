//
//  OLGSettings.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI

struct OLGSettings: View {
    
    @State private var hybridState: Bool = false
    @State private var electricState: Bool = true
    @State private var fuelCellState: Bool = false
    @State private var inversionState: Bool = true
    
    @State private var filtersExpanded: Bool = true
    
    var body: some View {
        //DisclosureGroup 적용
        Form() {
            DisclosureGroup(isExpanded: $filtersExpanded) {
                ToggleControl(title: "Hybrid Cars", state: hybridState)
                ToggleControl(title: "Electric Cars", state: electricState)
                ToggleControl(title: "Fuel Cell Cars", state: fuelCellState)
            } label: {
                Label("Categories Filers", systemImage: "car.2.fill")
            }
            
            
            DisclosureGroup {
                ColorControl(color: .red, label: "Background Color")
                ColorControl(color: .blue, label: "Foreground Color")
                ToggleControl(title: "Color Inversion Cars", state: inversionState)
            } label: {
                Label("Color Settings", systemImage: "scribble.variable")
            }
        }
        .modifier(StandardCustomSimpleText())
    }
}
            
struct ToggleControl: View {
    var title: String
    @State var state: Bool
    
    var body: some View {
        Toggle(title, isOn: $state)
            .padding(.leading)
    }
}

struct ColorControl: View {
    var color: Color
    var label: String
    
    var body: some View {
        HStack {
            Text(label)
            
            Spacer()
            Rectangle()
                .fill(color)
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    OLGSettings()
}
