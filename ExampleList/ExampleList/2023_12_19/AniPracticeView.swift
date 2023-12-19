//
//  AniPracticeView.swift
//  ExampleList
//
//  Created by 노주영 on 12/19/23.
//

import SwiftUI

struct AniPracticeView: View {
    var body: some View {
        ShapeView()
    }
}

struct ShapeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                PathView()
                Spacer().frame(height: 380)
                Circle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                
                Capsule()
                    .stroke(lineWidth: 10)
                    .foregroundStyle(.blue)
                    .frame(width: 200, height: 100)
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(style: StrokeStyle(lineWidth: 8, dash: [CGFloat(10)]))
                    .frame(width: 200, height: 100)
                
                Ellipse()
                    .stroke(style: StrokeStyle(lineWidth: 8, dash: [CGFloat(10), CGFloat(5), CGFloat(2)], dashPhase: 10))
                    .frame(width: 200, height: 100)
                
                Text("테두리 오버레이 사용")
                Ellipse()
                    .fill(.red)
                    .overlay {
                        Ellipse()
                            .stroke(.blue, lineWidth: 10)
                    }
                    .frame(width: 250, height: 150)
                
                Ellipse()
                    .fill(.red)
                    .border(.blue, width: 10)
                    .frame(width: 250, height: 150)
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding()
        }
    }
}

struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 10, y: 10))
            path.addLine(to: CGPoint(x: 10, y: 350))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addQuadCurve(to: CGPoint(x: 200, y: 200), control: CGPoint(x: 300, y: 200))
            path.closeSubpath()
        }
        .fill(.green)
    }
}
