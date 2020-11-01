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
                .lineLimit(2)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibility(label: Text("\("country".localized()): \(countryData.country)"))
            
            Text(countryData.confirmed.formatNumber())
                .fontWeight(.none)
                .font(.subheadline)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .center)
                .accessibility(label: Text("\("confirmed".localized()): \(countryData.confirmed.formatNumber())"))
            
            Text(countryData.deaths.formatNumber())
                .fontWeight(.none)
                .font(.subheadline)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(.red)
                .accessibility(label: Text("\("deaths".localized()): \(countryData.deaths.formatNumber())"))
            
            Text(countryData.recovered.formatNumber())
                .fontWeight(.none)
                .font(.subheadline)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(.green)
                .accessibility(label: Text("\("recovered".localized()): \(countryData.recovered.formatNumber())"))
        }
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(countryData: defaultCountryData)
    }
}
