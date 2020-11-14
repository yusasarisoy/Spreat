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
            BarChartView(data: ChartData(values: [("active".localized(), countryFetchRequest.countryStatisticsData!.active), ("recovered".localized(), countryFetchRequest.countryStatisticsData!.recovered), ("critical".localized(), countryFetchRequest.countryStatisticsData!.critical), ("deaths".localized(), countryFetchRequest.countryStatisticsData!.deaths)]), title: country, legend: "summary".localized())
                .padding(10)
            VStack {
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.confirmed.formatNumber() ?? "unknown".localized(), name: "confirmed".localized(), color: .gray)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.active.formatNumber() ?? "unknown".localized(), name: "active".localized(), color: .orange)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.newConfirmed ?? "unknown".localized(), name: "new_cases".localized(), color: .orange)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.recovered.formatNumber() ?? "unknown".localized(), name: "recovered".localized(), color: .green)
                CountryDetailsRow(number: String(format: "%.2f", countryFetchRequest.countryStatisticsData?.recoveryRate ?? 0.0) + "%", name: "recovery_rate".localized(), color: .green)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.critical.formatNumber() ?? "unknown".localized(), name: "critical".localized(), color: Color("AccentColor"))
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.deaths.formatNumber() ?? "unknown".localized(), name: "deaths".localized(), color: .red)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.newDeaths ?? "unknown".localized(), name: "new_deaths".localized(), color: .red)
                CountryDetailsRow(number: String(format: "%.2f", countryFetchRequest.countryStatisticsData?.fatalityRate ?? 0.0) + "%", name: "fatality_rate".localized(), color: .red)
                CountryDetailsRow(number: countryFetchRequest.countryStatisticsData?.tests.formatNumber() ?? "unknown".localized(), name: "total_tests".localized(), color: .green)
            }
            .background(Color("CardBackground"))
            .cornerRadius(12)
            .padding()
            .navigationBarTitle("Spreat - " + country)
            .onAppear() {
                self.getStatistics()
            }
        }
    }
    
    private func getStatistics() {
        countryFetchRequest.getCountryStatistics(country: self.country.replacingOccurrences(of: " ", with: "-"))
    }
}
