//
//  CountryDetailsRow.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 10.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct CountryDetailsRow: View {
    
    var number: String = "0"
    var name: String = "Unknown"
    var color: Color = .primary
    
    var body: some View {
        VStack {
            HStack {
                Text(self.name)
                    .font(.body)
                    .padding(.all, 15)
                
                Spacer()
                
                Text(self.number)
                    .font(.body)
                    .padding(.all, 5)
                    .foregroundColor(color)
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct CountryDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsRow()
    }
}
