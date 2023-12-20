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
    
    let menuItems = ["Travel", "Nature", "Architecture"]
    
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
                                .background(Capsule().foregroundStyle(Color(uiColor: .systemGray4)))
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
