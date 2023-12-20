//
//  AnimationDemoTwoView.swift
//  ExampleList
//
//  Created by 노주영 on 12/20/23.
//

import SwiftUI

struct AnimationDemoTwoView: View {
    @Namespace private var menuItemTransition
    
    @State var selectIndex: Int = 0
    
    let menuItems = ["Hue", "Animatable", "Phase", "Multi"]
    
    var body: some View {
        ZStack {
            AniGradientView()
            
            VStack(spacing: 30) {
                Spacer().frame(height: 60)
                HStack {
                    Spacer()
                    ForEach(menuItems.indices, id: \.self) { index in
                        if selectIndex == index {
                            MenuView(title: menuItems[index])
                                .background(Capsule().foregroundStyle(.purple))
                                .matchedGeometryEffect(id: "menuItem", in: menuItemTransition)
                                .onTapGesture {
                                    selectIndex = index
                                }
                        } else {
                            MenuView(title: menuItems[index])
                                .background(Capsule().foregroundStyle(Color(uiColor: .systemGray2)))
                                .onTapGesture {
                                    selectIndex = index
                                }
                        }
                        Spacer()
                    }
                }
                .padding()
                .animation(.easeInOut, value: selectIndex)
                
                if selectIndex == 0 {
                    HueGradientView()
                        .frame(maxHeight: .infinity)
                } else if selectIndex == 1 {
                    AnimatableGradientView()
                        .frame(maxHeight: .infinity)
                } else if selectIndex == 2 {
                    PhaseAnimatorView()
                        .frame(maxHeight: .infinity)
                } else if selectIndex == 3 {
                    MultiAnimatorView()
                        .frame(maxHeight: .infinity)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct MenuView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .bold))
    }
}

struct AniGradientView: View {
    @State private var animateGradient: Bool = false
    
    var body: some View {
        LinearGradient(colors: [.shapeGreen, .shapePink],
                       startPoint: animateGradient ? .topLeading : .bottomLeading,
                       endPoint: animateGradient ? .bottomTrailing : .topTrailing)
        .onAppear {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                animateGradient.toggle()
            }
        }
    }
}

struct HueGradientView: View {
    @State private var animateGradient: Bool = false
    
    var body: some View {
        LinearGradient(colors: [.yellow, .purple],
                       startPoint: animateGradient ? .topLeading : .bottomLeading,
                       endPoint: animateGradient ? .bottomTrailing : .topTrailing)
        .hueRotation(.degrees(animateGradient ? 45 : 0))
        .onAppear {
            withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                animateGradient.toggle()
            }
        }
    }
}

struct AnimatableGradientView: View {
    @State private var progress: CGFloat = 0.0
    
    let gradient1 = Gradient(colors: [.purple, .yellow])
    let gradient2 = Gradient(colors: [.blue, .shapehatRed])
    
    var body: some View {
        Rectangle()
            .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    progress = 1
                }
        }
    }
}

struct PhaseAnimatorView: View {
    @State var start: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .phaseAnimator([false, true], trigger: start) { content, phase in
                content
                    .scaleEffect(phase ? 1.0 : 0.5)
                    .foregroundStyle(phase ? .mint : .shapeGreen)
                    .rotation3DEffect(phase ? .degrees(720) : .zero, axis: (x: 0, y: 0, z: 1))
            } animation: { phase in
                if phase {
                    return .smooth.speed(0.3)
                } else {
                    return .spring.speed(0.5)
                }
            }
            .onTapGesture {
                start.toggle()
            }
    }
}

struct MultiAnimatorView: View {
    @State var start: Bool = false
    
    var body: some View {
        Text("🐳")
            .font(.system(size: 100))
            .bold()
            .phaseAnimator(Phase.allCases, trigger: start) { content, phase in
                content
                    .scaleEffect(phase.scale)
                    .rotationEffect(phase.angle)
                    .offset(y: phase.offset)
            } animation: { phase in
                switch phase {
                case .initial: return .smooth
                case .rotate:  return .smooth
                case .jump:    return .smooth
                case .fall:    return .smooth
                }
            }
            .onTapGesture {
                start.toggle()
            }
    }
}



extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        self.modifier(AniGradientModifier(fromGradient: fromGradient, toGradient: toGradient, progress: progress))
    }
}

struct AniGradientModifier: AnimatableModifier {
    let fromGradient: Gradient
    let toGradient: Gradient
    var progress: CGFloat = 0.0
    
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        var gradientColors: [Color] = []
        
        for i in 0..<fromGradient.stops.count {
            let fromColor = UIColor(fromGradient.stops[i].color)
            let toColor = UIColor(toGradient.stops[i].color)
            
            gradientColors.append(colorMixer(fromColor: fromColor, toColor: toColor, progress: progress))
        }
        
        return LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    func colorMixer(fromColor: UIColor, toColor: UIColor, progress: CGFloat) -> Color {
        guard let fromColor = fromColor.cgColor.components else { return Color(fromColor)}
        guard let toColor = toColor.cgColor.components else { return Color(toColor)}
        
        let red = fromColor[0] + (toColor[0] - fromColor[0]) * progress
        let green = fromColor[1] + (toColor[1] - fromColor[1]) * progress
        let blue = fromColor[2] + (toColor[2] - fromColor[2]) * progress
        
        return Color(uiColor: UIColor(red: red, green: green, blue: blue, alpha: 1))
    }
}

enum Phase: CaseIterable {
    case initial
    case rotate
    case jump
    case fall
    
    var scale: Double {
        switch self {
        case .initial:  1.0
        case .rotate:   1.5
        case .jump:     0.8
        case .fall:     0.5
        }
    }
    
    var angle: Angle {
        switch self {
        case .initial, .jump: Angle(degrees: 0)
        case .rotate:         Angle(degrees: 720)
        case .fall:           Angle(degrees: 360)
        }
    }
    
    var offset: Double {
        switch self {
        case .initial, .rotate: 0
        case .jump:             -200
        case .fall:             450
        }
    }
}
