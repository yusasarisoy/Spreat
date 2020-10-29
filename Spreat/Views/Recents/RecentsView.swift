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
import Network

struct RecentsView: View {
    
    // Go to "Map".
    @State var goToMap = false
    
    // Go to "News".
    @State var goToNews = false
    
    // Go to "Options".
    @State var goToOptions = false
    
    // Start monitorize the internet connection.
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    // If there is not satisfied internet connection, show an alert.
    @State private var internetConnectionLost: Bool = false
    
    // Get data for the world and the all countries.
    @ObservedObject var covidFetchRequest = COVIDFetchRequest()
    
    // Get detailed data for the all countries.
    @ObservedObject var covidCountryFetchRequest = COVIDCountryFetchRequest()
    
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
                    .foregroundColor(Color.gray)
                    .padding(.top, 10)
                    .accessibility(label: Text("\("last_updated".localized()): \(covidCountryFetchRequest.countryStatisticsData?.lastUpdated ?? "unknown".localized())"))
                
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
                
                // Go to "Map".
                NavigationLink(
                    destination: MapContainerView(),
                    isActive: $goToMap
                ) {
                    EmptyView()
                }.isDetailLink(false)
                
                // Go to "News".
                NavigationLink(
                    destination: NewsView(),
                    isActive: $goToNews
                ) {
                    EmptyView()
                }.isDetailLink(false)
                
                // Go to "Options".
                NavigationLink(
                    destination: OptionsView(),
                    isActive: $goToOptions
                ) {
                    EmptyView()
                }.isDetailLink(false)
            }
            .onAppear() {
                // Disable highlighting the cell when it clicked.
                UITableViewCell.appearance().selectionStyle = .none
                
                // Start monitorize the internet connection.
                self.monitor.start(queue: self.queue)
                
                self.monitor.pathUpdateHandler = { path in
                    if path.status != .satisfied {
                        // If there is not satisfied internet connection, show an alert.
                        self.internetConnectionLost = true
                    }
                }
            }
            
            // The title of the NavigationView.
            .navigationBarTitle("Spreat - \(("recent").localized())", displayMode: .inline)
            .accessibility(label: Text("Spreat - \(("recent").localized())"))
            
            // The search icon of the NavigationView at the top right.
            .navigationBarItems(leading: HStack {
                Button(action: {
                    // Toggle the SearchBar.
                    self.isGraphicActive.toggle()
                }, label: {
                    Image(systemName: isGraphicActive ? "info.circle.fill" : "chart.bar.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
                
                Divider()
                
                // Go to "Map".
                Button(action: {
                    self.goToMap.toggle()
                }, label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
            }, trailing: HStack {
                Button(action: {
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
                
                Divider()
                
                // Go to "News".
                Button(action: {
                    self.goToNews.toggle()
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
                
                Divider()
                
                // Change the "Options".
                Button(action: {
                    self.goToOptions.toggle()
                }, label: {
                    Image(systemName: "globe")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
            }
            )
        }
        .accentColor(Color("AccentColor"))
        
        // If there is not satisfied internet connection, show an alert.
        .alert(isPresented: $internetConnectionLost) {
            Alert(
                title: Text("offline".localized()),
                message: Text("no_internet".localized()),
                dismissButton: .default(Text("ok".localized()), action: {
                    // Leave the application.
                    exit(0);
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
