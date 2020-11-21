//
//  OptionsRowView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 21.11.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct OptionsRowView: View {
    
    // MARK: - Properties
    
    var title: String
    
    var content: String? = nil
    
    var linkLabel: String? = nil
    
    var linkDestination: String? = nil
    
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(Color("AccentColor"))
                } else {
                    EmptyView()
                }
            } //: HStack
        } //: VStack
    } //: View
}

// MARK: - Preview

@available(iOS 14.0, *)
struct OptionsRowView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsRowView(title: "developer".localized(), content: "Yuşa Sarısoy")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
