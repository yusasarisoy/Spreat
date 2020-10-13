//
//  WorldDataCard.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 10.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct WorldDataCard: View {
    
    var number: String = "0"
    var name: String = "unknown".localized()
    var color: Color = .primary
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(self.number)
                    .font(.footnote)
                    .padding(.vertical, 5)
                    .foregroundColor(self.color)
                Text(self.name)
                    .font(.footnote)
                    .foregroundColor(self.color)
            }
            .frame(width: geometry.size.width, height: 65, alignment: .center)
            .background(Color("CardBackground"))
            .cornerRadius(12)
        }
    }
}

struct WorldDataCard_Previews: PreviewProvider {
    static var previews: some View {
        WorldDataCard()
    }
}
