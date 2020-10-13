//
//  CountryDetailsView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 10.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct CountryDetailsView: View {
    
    @ObservedObject var countryFetchRequest = COVIDCountryFetchRequest()
    
    let chartStyle = ChartStyle(backgroundColor: Color("CardBackground"), accentColor: Color.orange, secondGradientColor: Colors.OrangeEnd, textColor: Color.white, legendTextColor: Color.white, dropShadowColor: Color.gray)
    
    var country: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            BarChartView(data: ChartData(values: [("Active", countryFetchRequest.countryStatisticsData!.active), ("Recovered", countryFetchRequest.countryStatisticsData!.recovered), ("Critical",  countryFetchRequest.countryStatisticsData!.critical), ("Deaths",  countryFetchRequest.countryStatisticsData!.deaths)]), title: country, legend: "Summary")
                .padding(10)
            VStack {
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.confirmed.formatNumber() ?? "Unknown", name: "Confirmed", color: .gray)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.active.formatNumber() ?? "Unknown", name: "Active", color: .orange)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.newConfirmed ?? "Unknown", name: "New Cases", color: .orange)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.recovered.formatNumber() ?? "Unknown", name: "Recovered", color: .green)
                CountryDetailsRow(number: String(format: "%.2f", countryFetchRequest.countryStatisticsData?.recoveryRate ?? 0.0) + "%", name: "Recovery Rate", color: .green)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.critical.formatNumber() ?? "Unknown", name: "Critical", color: .yellow)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.deaths.formatNumber() ?? "Unknown", name: "Deaths", color: .red)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.newDeaths ?? "Unknown", name: "New Deaths", color: .red)
                CountryDetailsRow(number: String(format: "%.2f", countryFetchRequest.countryStatisticsData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.tests.formatNumber() ?? "Unknown", name: "Total Tests", color: .green)
            }
            .background(Color("CardBackground"))
            .cornerRadius(12)
            .padding()
            .navigationBarTitle("Spreat - " + country)
            .onAppear() {
                self.getStatistics()
            }
        }
        .padding()
    }
    
    private func getStatistics() {
        countryFetchRequest.getCountryStatistics(country: self.country.replacingOccurrences(of: " ", with: "-"))
    }
}
