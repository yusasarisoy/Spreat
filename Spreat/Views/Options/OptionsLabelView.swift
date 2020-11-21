//
//  OptionsLabelView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 21.11.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct OptionsLabelView: View {
    
    // MARK: - Properties
    
    var labelText: String
    
    var labelImage: String
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}


// MARK: - Preview

struct OptionsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsLabelView(labelText: "Spreat", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
