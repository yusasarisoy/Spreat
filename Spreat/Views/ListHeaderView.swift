//
//  ListHeaderView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 9.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    let headers = ["Country", "Confirmed", "Deaths", "Recovered"]
    
    var body: some View {
        HStack {
            ForEach(headers, id: \.self) { header in
                Text(header)
                    .fontWeight(.none)
                    .font(.subheadline)
                    .padding(.all, 10)
                    .frame(maxWidth: .infinity)
            }
        }
        .background(Color.gray)
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
