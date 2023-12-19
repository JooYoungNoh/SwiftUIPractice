//
//  ShapeDrawView.swift
//  ExampleList
//
//  Created by 노주영 on 12/19/23.
//

import SwiftUI

struct ShapeDrawView: View {
    var body: some View {
        ScrollView {
            VStack {
                ShapeOneView()
                    .fill(.purple)
                    .overlay {
                        ShapeOneView()
                            .stroke(.black, lineWidth: 5)
                    }
                
                Spacer().frame(height: 200)
                
                ZStack {
                    ShapeTwoYellowView()
                        .fill(.yellow)
                    
                    ShapeTwoCyanView()
                        .fill(.cyan)
                    
                    ShapeTwoBlueView()
                        .fill(.blue)
                    
                    ShapeTwoPurpleView()
                        .fill(.purple)
                        .overlay {
                            ShapeTwoPurpleView()
                                .stroke(.black, lineWidth: 10)
                        }
                    
                    Text("25%")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.leading, 140)
                        .padding(.top, 220)
                }
                .padding(.horizontal, 30)
                
                Spacer().frame(height: 200)
                
                ZStack {
                    ShapeFiveHatView()
                        .fill(.shapehatRed)
                        .overlay {
                            ShapeFiveHatView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                    
                    ShapeFiveYellowView()
                        .fill(.shapehatYellow)
                    
                    ShapeFiveFaceView()
                        .fill(.shapeGreen)
                        .overlay {
                            ShapeFiveFaceView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                    
                    ShapeFiveMouseView()
                        .fill(.gray)
                        .overlay {
                            ShapeFiveMouseView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                    
                    FaceView()
                    
                    ShapeFiveBodyView()
                        .fill(.shapeGreen)
                        .overlay {
                            ShapeFiveBodyView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                    
                    ShapeFiveHandOneView()
                        .fill(.shapeGreen)
                        .overlay {
                            ShapeFiveHandOneView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                    
                    ShapeFiveHandTwoView()
                        .fill(.shapeGreen)
                        .overlay {
                            ShapeFiveHandTwoView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                }
                
                Spacer().frame(height: 600)
            }
        }
    }
}

struct ShapeOneView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 20, y: 100))
        path.addLine(to: CGPoint(x: 20, y: 150))
        path.addLine(to: CGPoint(x: 220, y: 150))
        path.addLine(to: CGPoint(x: 220, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addQuadCurve(to: CGPoint(x: 40, y: 100), control: CGPoint(x: 120, y: 30))
        path.closeSubpath()
        
        return path
    }
}

struct ShapeTwoYellowView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 300, y: 150))
        path.addArc(
            center: CGPoint(x: 150, y: 150),
            radius: 150,
            startAngle: .degrees(0),
            endAngle: .degrees(190),
            clockwise: true
        )
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.closeSubpath()
        
        
        return path
    }
}

struct ShapeTwoCyanView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: 150, y: 150),
            radius: 150,
            startAngle: .degrees(110),
            endAngle: .degrees(190),
            clockwise: false
        )
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.closeSubpath()
        
        
        return path
    }
}

struct ShapeTwoBlueView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 150, y: 300))
        path.addArc(
            center: CGPoint(x: 150, y: 150),
            radius: 150,
            startAngle: .degrees(90),
            endAngle: .degrees(110),
            clockwise: false
        )
        path.addLine(to: CGPoint(x: 150, y: 150))
        path.closeSubpath()
        
        
        return path
    }
}

struct ShapeTwoPurpleView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: 170, y: 170),
            radius: 150,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )
        path.addLine(to: CGPoint(x: 170, y: 170))
        path.closeSubpath()
        
        return path
    }
}

struct ShapeFiveHatView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 250, y: 0))
        path.addLine(to: CGPoint(x: 300, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 100))
        
        path.closeSubpath()
        
        return path
    }
}

struct ShapeFiveYellowView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 205, y: 100))
        path.addQuadCurve(to: CGPoint(x: 275, y: 60), control: CGPoint(x: 240, y: 90))
        path.addLine(to: CGPoint(x: 264, y: 40))
        path.addQuadCurve(to: CGPoint(x: 215, y: 80), control: CGPoint(x: 230, y: 70))
        
        path.closeSubpath()
        
        return path
    }
}

struct FaceView: View {
    var body: some View {
        //코
        Circle()
            .frame(width: 10, height: 10)
            .foregroundStyle(.black)
            .offset(x: -80, y: 170)
        
        Circle()
            .frame(width: 10, height: 10)
            .foregroundStyle(.black)
            .offset(x: -40, y: 170)
        
        //눈
        Capsule()
            .fill(.black)
            .frame(width: 15, height: 22)
            .offset(x: 10, y: 115)
        
        Capsule()
            .fill(.black)
            .frame(width: 15, height: 22)
            .offset(x: 70, y: 115)
        
        //분홍이
        Ellipse()
            .fill(.shapePink)
            .frame(width: 30, height: 15)
            .offset(x: -8, y: 135)
        
        Ellipse()
            .fill(.shapePink)
            .frame(width: 30, height: 15)
            .offset(x: 85, y: 135)
    }
}

struct ShapeFiveMouseView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 115, y: 200))
        path.addLine(to: CGPoint(x: 155, y: 200))
        path.addLine(to: CGPoint(x: 155, y: 220))
        path.addArc(
            center: CGPoint(x: 135, y: 220),
            radius: 20,
            startAngle: .degrees(0),
            endAngle: .degrees(180),
            clockwise: false
        )
        path.addLine(to: CGPoint(x: 115, y: 200))
        path.closeSubpath()
        
        return path
    }
}

struct ShapeFiveFaceView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 300, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addQuadCurve(to: CGPoint(x: 170, y: 130), control: CGPoint(x: 185, y: 110))
        path.addQuadCurve(to: CGPoint(x: 110, y: 150), control: CGPoint(x: 155, y: 145))
        path.addQuadCurve(to: CGPoint(x: 60, y: 200), control: CGPoint(x: 70, y: 155))
        path.addQuadCurve(to: CGPoint(x: 60, y: 220), control: CGPoint(x: 60, y: 200))
        path.addQuadCurve(to: CGPoint(x: 110, y: 280), control: CGPoint(x: 70, y: 270))
        path.addLine(to: CGPoint(x: 280, y: 280))
        path.addQuadCurve(to: CGPoint(x: 330, y: 220), control: CGPoint(x: 335, y: 270))
        path.addQuadCurve(to: CGPoint(x: 330, y: 150), control: CGPoint(x: 330, y: 150))
        path.addQuadCurve(to: CGPoint(x: 300, y: 100), control: CGPoint(x: 325, y: 110))
        
        path.closeSubpath()
        
        return path
    }
}

struct ShapeFiveBodyView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 170, y: 280))
        path.addQuadCurve(to: CGPoint(x: 180, y: 380), control: CGPoint(x: 150, y: 330))
        path.addQuadCurve(to: CGPoint(x: 305, y: 380), control: CGPoint(x: 240, y: 420))
        path.addQuadCurve(to: CGPoint(x: 305, y: 275), control: CGPoint(x: 330, y: 330))
        
        path.closeSubpath()
        
        return path
    }
}

struct ShapeFiveHandOneView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 260, y: 330))
        path.addLine(to: CGPoint(x: 230, y: 360))
        path.addQuadCurve(to: CGPoint(x: 210, y: 345), control: CGPoint(x: 205, y: 370))
        path.addLine(to: CGPoint(x: 250, y: 310))
        
        return path
    }
}

struct ShapeFiveHandTwoView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 157, y: 315))
        path.addLine(to: CGPoint(x: 135, y: 330))
        path.addQuadCurve(to: CGPoint(x: 140, y: 355), control: CGPoint(x: 115, y: 350))
        path.addLine(to: CGPoint(x: 160, y: 345))
        
        return path
    }
}


