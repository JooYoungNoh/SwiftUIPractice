//
//  CombineUIKitView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/24.
//

import SwiftUI

struct CombineUIKitView: View {
    @State var imagePickerVisible: Bool = false
    @State var selectedImage: Image? = Image(systemName: "photo")
    
    var body: some View {
        ZStack {
            VStack {
                MyScrollView(text: "UIView in SwiftUI")
                    .padding(.bottom, 30)
                selectedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .gray, radius: 1, x: 1, y: 5)
                    .cornerRadius(10)
                
                Button("Select an Image") {
                    imagePickerVisible.toggle()
                }
            }
            .padding()
            
            if imagePickerVisible {
                MyImagePicker(imagePickerVisible: $imagePickerVisible, selectedImage: $selectedImage)
            }
        }
    }
}

#Preview {
    CombineUIKitView()
}
