//
//  RecentsView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 9.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI
import SwiftUICharts
import Localize_Swift

struct RecentsView: View {
    // Get data for the world and the all countries.
    @ObservedObject var covidFetchRequest = COVIDFetchRequest()
    
    // Get detailed data for the all countries.
    @ObservedObject var covidCountryFetchRequest = COVIDCountryFetchRequest()
    
    // Get news for the country.
    @ObservedObject var covidNewsFetchRequest = COVIDNewsFetchRequest()
    
    @State var isGraphicActive: Bool = false
    
    let chartStyle = ChartStyle(backgroundColor: Color("CardBackground"), accentColor: Color.orange, secondGradientColor: Colors.OrangeEnd, textColor: Color.white, legendTextColor: Color.white, dropShadowColor: Color.gray)
    
    // The text of the SearchBar.
    @State var searchText = ""
    
    // Check if the SearchBar is visible.
    @State var isSearchVisible: Bool = false
    
    var body: some View {
        // NavigationView will cover the RecentsView.
        NavigationView {
            
            // Vertical stack will cover the entire components in the RecentsView.
            VStack {
                
                // Check if the SearchBar is visible.
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                
                // Get the last updated time.
                Text("\("last_updated".localized()): \(covidCountryFetchRequest.countryStatisticsData?.lastUpdated ?? "unknown".localized())")
                    .font(.subheadline)
                    .foregroundColor(isGraphicActive ? Color.gray : Color.white)
                    .padding(.top, 10)
                
                if isGraphicActive {
                    BarChartView(data: ChartData(values: [("\("confirmed".localized())", covidFetchRequest.worldData.confirmed), ("\("critical".localized())", covidFetchRequest.worldData.critical), ("\("deaths".localized())", covidFetchRequest.worldData.deaths), ("\("recovered".localized())", covidFetchRequest.worldData.recovered)]), title: "\("global".localized())", legend: "\("recent".localized())")
                        .padding(10)
                    
                } else {
                    // Get the world data.
                    WorldDataView(worldData: covidFetchRequest.worldData)
                }
                
                // Set the titles to present the statistics of COVID-19.
                ListHeaderView()
                
                // Get the data for all countries and present them on the list.
                List {
                    ForEach(covidFetchRequest.countriesData.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        // Go to the country details.
                        NavigationLink(destination: CountryDetailsView(country: countryData.country)) {
                            CountryRowView(countryData: countryData)
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
                
                // The title of the NavigationView.
                .navigationBarTitle("Spreat - \(("recent").localized())", displayMode: .inline)
                
                // The search icon of the NavigationView at the top right.
                .navigationBarItems(leading: Button(action: {
                    // Toggle the SearchBar.
                    self.isGraphicActive.toggle()
                }, label: {
                    Image(systemName: isGraphicActive ? "info.circle.fill" : "chart.bar.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                }), trailing: Button(action: {
                    // Toggle the SearchBar.
                    self.isSearchVisible.toggle()
                    
                    // If the SearchBar is not visible, clear its text.
                    if !self.isSearchVisible {
                        self.searchText = ""
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
            )
        }
    }
}

struct RecentsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentsView()
    }
}
