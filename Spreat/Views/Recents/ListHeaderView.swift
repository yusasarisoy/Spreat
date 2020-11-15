//
//  ListHeaderView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 9.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    let headers = ["country".localized(), "confirmed".localized(), "deaths".localized(), "recovered".localized()]
    
    var body: some View {
        HStack {
            ForEach(headers, id: \.self) { header in
                Text(header)
                    .fontWeight(.none)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .accessibility(label: Text(header))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .foregroundColor(Color("AccentColor"))
            }
        }
        .padding(.horizontal, 15)
        .background(Color("CardBackground"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
