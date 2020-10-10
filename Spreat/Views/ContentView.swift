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
                Tab(imageName: "chart.bar", text: "Recents")
            }
            .tag(0)
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