//
//  ShapeDrawView.swift
//  ExampleList
//
//  Created by 노주영 on 12/19/23.
//

import SwiftUI

struct ShapeDrawView: View {
    @State var start: Bool = false
    @State var back: Bool = false
    
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
                    if back {
                        AniGradientView()
                            .ignoresSafeArea()
                    }
                    
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
                    
                    ShapeFiveBodyLightView()
                        .fill(.shapeBodyLight)
                    
                    ShapeFiveHandOneView()
                        .fill(.shapeHand)
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
                    
                    ShapeFiveLegOneView()
                        .fill(.shapeGreen)
                        .overlay {
                            ShapeFiveLegOneView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                    
                    ShapeFiveLegTwoView()
                        .fill(.shapeGreen)
                        .overlay {
                            ShapeFiveLegTwoView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                    
                    ShapeFivetailView()
                        .fill(.shapeGreen)
                        .overlay {
                            ShapeFivetailView()
                                .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                        }
                    
                    FireAnimatorView(start: $start)
                        .onTapGesture {
                            back = false
                            start.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                back = true
                            }
                        }
                }
                .padding(.leading, -40)
                .frame(height: 500)
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
            .offset(x: -100, y: -70)
        
        Circle()
            .frame(width: 10, height: 10)
            .foregroundStyle(.black)
            .offset(x: -60, y: -70)
        
        //눈
        Capsule()
            .fill(.black)
            .frame(width: 15, height: 22)
            .offset(x: -10, y: -125)
        
        Capsule()
            .fill(.black)
            .frame(width: 15, height: 22)
            .offset(x: 50, y: -125)
        
        //분홍이
        Ellipse()
            .fill(.shapePink)
            .frame(width: 30, height: 15)
            .offset(x: -28, y: -105)
        
        Ellipse()
            .fill(.shapePink)
            .frame(width: 30, height: 15)
            .offset(x: 65, y: -105)
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

struct ShapeFiveBodyLightView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 167, y: 320))
        path.addQuadCurve(to: CGPoint(x: 250, y: 393), control: CGPoint(x: 250, y: 320))
        path.addQuadCurve(to: CGPoint(x: 185, y: 378), control: CGPoint(x: 215, y: 395))
        path.addQuadCurve(to: CGPoint(x: 167, y: 320), control: CGPoint(x: 167, y: 340))
        
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

struct ShapeFiveLegOneView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 190, y: 392))
        path.addQuadCurve(to: CGPoint(x: 195, y: 430), control: CGPoint(x: 187, y: 415))
        path.addQuadCurve(to: CGPoint(x: 220, y: 430), control: CGPoint(x: 208, y: 440))
        path.addQuadCurve(to: CGPoint(x: 220, y: 403), control: CGPoint(x: 218, y: 415))
        
        return path
    }
}

struct ShapeFiveLegTwoView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 250, y: 405))
        path.addQuadCurve(to: CGPoint(x: 255, y: 430), control: CGPoint(x: 250, y: 415))
        path.addQuadCurve(to: CGPoint(x: 280, y: 430), control: CGPoint(x: 268, y: 440))
        path.addQuadCurve(to: CGPoint(x: 280, y: 397), control: CGPoint(x: 278, y: 410))
        
        return path
    }
}

struct ShapeFivetailView: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: 311, y: 380))
        path.addQuadCurve(to: CGPoint(x: 420, y: 355), control: CGPoint(x: 320, y: 380))
        path.addQuadCurve(to: CGPoint(x: 323, y: 335), control: CGPoint(x: 330, y: 345))
        
        
        return path
    }
}

//MARK: 애니메이션
struct FireAnimatorView: View {
    @Binding var start: Bool
    
    var body: some View {
        Text("🔥")
            .font(.system(size: 70))
            .bold()
            .keyframeAnimator(initialValue: FireValue(), trigger: start) { content, value in
                content
                    .scaleEffect(value.scale)
                    .rotationEffect(value.rotation)
                    .offset(value.translation)
            } keyframes: { value in
                KeyframeTrack(\.scale) {
                    CubicKeyframe(0.4, duration: 0.1)
                    CubicKeyframe(0.6, duration: 0.1)
                    CubicKeyframe(0.8, duration: 0.1)
                    CubicKeyframe(1.0, duration: 0.1)
                    CubicKeyframe(1.2, duration: 0.1)
                }
                
                KeyframeTrack(\.rotation) {
                    CubicKeyframe(.degrees(-90), duration: 0.5)
                    CubicKeyframe(.degrees(30), duration: 0.2)
                }
                
                KeyframeTrack(\.translation) {
                    CubicKeyframe(CGSize(width: -110, height: -30), duration: 0.7)
                    CubicKeyframe(CGSize(width: 140, height: -170), duration: 0.5)
                }
            }
    }
}

struct FireValue {
    var scale = 0.2
    var rotation: Angle = .degrees(-90)
    var translation = CGSize(width: -120, height: -30)
}
