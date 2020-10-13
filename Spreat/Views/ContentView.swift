//
//  ContentView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 9.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // TabView will cover the RecentsView.
        TabView {
            
            // First tab item will be "Recents".
            RecentsView().tabItem {
                Tab(imageName: "table.fill", text: "Recent")
            }
            .tag(0)
            
            // Second tab item will be "Map".
            MapContainerView()
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Tab(imageName: "map.fill", text: "Map")
            }
            .tag(1)
            
            // Third tab item will be "News".
            NewsView()
                .tabItem {
                    Tab(imageName: "paperplane.fill", text: "News")
            }
            .tag(2)
        }
    }
}

private struct Tab: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}
