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
                    .font(.footnote)
                    .padding(.all, 10)
                    .frame(maxWidth: .infinity)
            }
        }
        .background(Color("CardBackground"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
