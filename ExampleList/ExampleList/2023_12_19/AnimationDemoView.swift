//
//  AnimationDemoView.swift
//  ExampleList
//
//  Created by 노주영 on 12/19/23.
//

import SwiftUI

struct AnimationDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ButtonAniView()
                ButtonAniTwoView()
                CircleAniView()
                StateBindingAniView()
                AutoStartAniView()
            }
        }
    }
}

struct ButtonAniView: View {
    @State private var rotation: Double = 0.0
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Button {
            rotation = rotation < 360 ? rotation + 60 : 0
            scale = scale < 2 ? scale + 0.3 : 1
        } label: {
            Text("Click")
                .frame(width: 300)
                .rotationEffect(.degrees(rotation))
                .scaleEffect(scale)
                .animation(.linear(duration: 1).repeatCount(2), value: rotation)
                //.animation(.spring(response: 1.0, dampingFraction: 0.2, blendDuration: 0), value: rotation)
        }

    }
}

struct ButtonAniTwoView: View {
    @State private var rotation: Double = 0.0
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Button {
            withAnimation(.linear(duration: 2)) {
                rotation = rotation < 360 ? rotation + 60 : 0
            }
            scale = scale < 2 ? scale + 0.3 : 1
        } label: {
            Text("Click")
                .frame(width: 300)
                .rotationEffect(.degrees(rotation))
                .scaleEffect(scale)
                //.animation(.linear(duration: 1).repeatCount(2), value: rotation)
                //.animation(.spring(response: 1.0, dampingFraction: 0.2, blendDuration: 0), value: rotation)
        }

    }
}

struct CircleAniView: View {
    @State private var yellowCircle: Bool = false
    
    var body: some View {
        Circle()
            .fill(yellowCircle ? .yellow : .blue)
            .frame(width: 100, height: 100)
            .onTapGesture {
                withAnimation {
                    yellowCircle.toggle()
                }
            }
    }
}

struct StateBindingAniView: View {
    @State private var visibility: Bool = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $visibility.animation(.easeIn)) {
                Text("Toggle")
            }
            .padding()
            
            if visibility {
                Text("Hello world")
                    .font(.largeTitle)
            } else {
                Text("Goodbye world")
                    .font(.largeTitle)
            }
        }
    }
}

struct AutoStartAniView: View {
    @State private var rotation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundStyle(.blue)
                .frame(width: 300, height: 300)
            
            Image(systemName: "forward.fill")
                .font(.largeTitle)
                .offset(y: -150)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: rotation)
        }
        .onAppear {
            rotation = 360
        }
    }
}

