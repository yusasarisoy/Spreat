//
//  SearchView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 10.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("search".localized(), text: $searchText)
                .padding()
                .accessibility(hint: Text("search".localized()))
        }
        .frame(height: 50)
        .background(Color("CardBackground"))
    }
}
