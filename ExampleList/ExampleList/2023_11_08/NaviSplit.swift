//
//  NaviSplit.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/08.
//

import SwiftUI

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}

struct NaviSplit: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var categories = [
        IconCategory(categoryName: "Folders", images: ["questionmark.folder.ar",
                                                       "questionmark.folder",
                                                       "questionmark.folder.fill.ar",
                                                       "folder.fill.badge.gear",
                                                       "questionmark.folder.fill"]),
        IconCategory(categoryName: "Circles", images:
                        ["book.circle",
                         "books.vertical.circle",
                         "books.vertical.circle.fill",
                         "book.circle.fill",
                         "book.closed.circle"]),
        IconCategory(categoryName: "Clouds", images:
                        ["cloud.rain",
                         "cloud",
                         "cloud.drizzle.fill",
                         "cloud.fill",
                         "cloud.drizzle"])
        
    ]
    @State private var selectedCategory: IconCategory?
    @State private var selectedImage: String?
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    
    var body: some View {
        VStack {
            NavigationSplitView(columnVisibility: $columnVisibility) {
                List(categories, selection: $selectedCategory) { category in
                    Text(category.categoryName).tag(category)
                }
            } content: {
                if let selectedCategory {
                    List(selectedCategory.images, id: \.self, selection: $selectedImage) { image in
                        HStack {
                            Image(systemName: image)
                            Text(image)
                        }
                        .tag(image)
                    }
                } else {
                    Text("Select a category")
                }
            } detail: {
                if let selectedImage {
                    Image(systemName: selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } else {
                    Text("Select a image")
                }
            }
            .navigationSplitViewStyle(.balanced)
            
            if let selectedCategory, let selectedImage {
                HStack {
                    Text(selectedCategory.categoryName)
                        .padding()
                    Text(selectedImage)
                        .padding()
                }
            } else {
                HStack {
                    Text("Select a category")
                        .padding()
                    Text("Select a image")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    NaviSplit()
}
