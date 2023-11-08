//
//  NaviSplitThree.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI
import AVKit

struct Cele: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var videoLink: String
}

struct NaviSplitThree: View {
    @State private var woman = ["여자 연예인"]
    
    @State private var celeList = [
        Cele(name: "조유리", videoLink: "https://i.namu.wiki/i/UHyaI3L98JnbIr62x-WNKnXGDFs1t5okDOc38cLQTB1lB44KM6mixKLLwj07vNcfhwPQx4dk-LdyeL8aiQ_RUw.mp4"),
        Cele(name: "카리나", videoLink: "https://i.namu.wiki/i/JrCNJsZW3O1e5otW7716k0kOS2kKgYCagPRmLEv3Rnkd6meQL1GavsCK7cgJVARJ9rvpPj9IloOLq0LfltG-VQ.mp4"),
        Cele(name: "아이유", videoLink: "https://i.namu.wiki/i/j0S1Lo7zgW-PL1ydmS5xj7ni90DxwrX-k8YW9dkryEL6ZfEZy5O0w0P_Tl251uKIL7PZppF4dO-HH_5YWbIaPw.mp4")
        
    ]
    
    @State private var selectedWoman: [String]?
    @State private var selectedItem: Cele?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(woman, id: \.self, selection: $selectedWoman){ woman in
                Text(woman).tag(woman)
            }
            .navigationSplitViewColumnWidth(150)
        } content: {
            List(celeList, selection: $selectedItem) { item in
                Text(item.name).tag(item)
            }
        } detail: {
            if let selectedItem {
                VStack {
                    VideoPlayer(player: AVPlayer(url: URL(string: selectedItem.videoLink)!))
                }
                .padding(.vertical)
                
                Text(selectedItem.name)
                    .modifier(StandardCustomSimpleTitle())
            } else {
                Text("Select")
            }
        }
        
    }
}

#Preview {
    NaviSplitThree()
}
