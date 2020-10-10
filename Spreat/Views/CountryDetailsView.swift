//
//  CountryDetailsView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 10.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct CountryDetailsView: View {
    
    var countryData: CountryData
    
    var body: some View {
        VStack {
            CountryDetailsRow(number: countryData.confirmed.formatNumber(), name: "Confirmed")
            CountryDetailsRow(number: countryData.critical.formatNumber(), name: "Critical", color: .yellow)
            CountryDetailsRow(number: countryData.deaths.formatNumber(), name: "Deaths", color: .red)
            CountryDetailsRow(number: String.init(format: "%.2f", countryData.fatalityRate), name: "Death (%)", color: .red)
            CountryDetailsRow(number: countryData.recovered.formatNumber(), name: "Recovered", color: .green)
            CountryDetailsRow(number: String.init(format: "%.2f", countryData.recoveryRate), name: "Recovery (%)", color: .green)
        }
        .background(Color("CardBackground"))
        .cornerRadius(12)
        .padding()
        .navigationBarTitle("Spreat - " + countryData.country)
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(countryData: defaultCountryData)
    }
}
