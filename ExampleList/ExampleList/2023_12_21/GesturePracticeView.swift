//
//  GesturePracticeView.swift
//  ExampleList
//
//  Created by 노주영 on 12/21/23.
//

import SwiftUI

struct GesturePracticeView: View {
    @State private var imageScale: CGFloat = 1.0
    @State private var imageOpacity: Double = 1.0
    @State private var imageOffset: CGSize = .zero
    @State private var saveOffset: CGSize = .zero
    
    @State private var imageTwoScale: CGFloat = 1.0
    @State private var imageTwoOpacity: Double = 1.0
    @State private var imageTwoOffset: CGSize = .zero
    @State private var saveTwoOffset: CGSize = .zero
    @State private var isDrag: Bool = false
    
    var body: some View {
        let tap = TapGesture()
            .onEnded {
                withAnimation(.easeInOut(duration: 1)) {
                    if imageOpacity < 0.5 {
                        imageOpacity = 1.0
                    } else {
                        imageOpacity = 0.4
                    }
                }
            }
        
        let longTap = LongPressGesture(minimumDuration: 1)
            .onChanged { value in
                if value {
                    withAnimation(.spring(response: 1, dampingFraction: 0.3, blendDuration: 0)) {
                        if imageScale == 2.0 {
                            imageScale = 1.0
                            
                            withAnimation(.easeInOut(duration: 1)) {
                                imageOpacity = 1.0
                            }
                        } else {
                            imageScale = 2.0
                        }
                    }
                }
            }
            .onEnded { value in
                
            }
        
        let drag = DragGesture()
            .onChanged({ dragValue in
                imageOffset = saveOffset + dragValue.translation
            })
            .onEnded { dragValue in
                saveOffset = saveOffset + dragValue.translation
            }
        
        let combineLong = LongPressGesture(minimumDuration: 1)
            .onEnded { _ in
                withAnimation(.easeInOut(duration: 1)) {
                    imageTwoOpacity = 0.5
                }
                
                withAnimation(.spring(response: 1, dampingFraction: 0.3, blendDuration: 0)) {
                    imageTwoScale = 2.0
                }
                
                isDrag = true
            }
            .sequenced(before: DragGesture())
            .onChanged { value in
                switch value {
                case .first(true):
                    print("Long Press")
                case .second(true, let dragValue):
                    imageTwoOffset = saveTwoOffset + (dragValue?.translation ?? .zero)
                default: break
                }
            }
            .onEnded { value in
                switch value {
                case .first(true):
                    print("Long Press End")
                case .second(true, let dragValue):
                    saveTwoOffset = saveTwoOffset + (dragValue?.translation ?? .zero)
                default: break
                }
                
                withAnimation(.easeInOut(duration: 1)) {
                    imageTwoOpacity = 1.0
                }
                
                withAnimation(.spring(response: 1, dampingFraction: 0.3, blendDuration: 0)) {
                    imageTwoScale = 1.0
                }
                
                isDrag = false
            }
           
        
        VStack {
            Image("pretty")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(50)
                .opacity(imageOpacity)
                .scaleEffect(imageScale)
                .offset(imageOffset)
                .gesture(tap)
                .gesture(longTap)
                .gesture(drag)
            
            Image("cute")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(50)
                .opacity(imageTwoOpacity)
                .scaleEffect(imageTwoScale)
                .offset(imageTwoOffset)
                .gesture(combineLong)
        }
        .padding()
    }
}

extension CGSize {
  static func + (lhs: Self, rhs: Self) -> Self {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
  }
}
