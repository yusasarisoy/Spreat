//
//  CountryRowView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 9.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct CountryRowView: View {
    var countryData: CountryData
    
    var body: some View {
        HStack {
            Text(countryData.country)
                .fontWeight(.none)
                .font(.subheadline)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            
            Text(countryData.confirmed.formatNumber())
                .fontWeight(.none)
                .font(.subheadline)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text(countryData.deaths.formatNumber())
                .fontWeight(.none)
                .font(.subheadline)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(.red)
            
            Text(countryData.recovered.formatNumber())
                .fontWeight(.none)
                .font(.subheadline)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(.green)
        }
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(countryData: defaultCountryData)
    }
}
