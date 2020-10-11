//
//  COVIDCountryFetchRequest.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 10.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class COVIDCountryFetchRequest: ObservableObject {
    
    @Published var countryStatisticsData: CountryStatisticsData?
    
    init() {
        getCountryStatistics(country: "Turkey")
    }
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "99ce4b6f4amshe0c43f8efa1f864p17c934jsn12a890f88045"
    ]
    
    // Get the total numbers about COVID-19.
    func getCountryStatistics(country: String) {
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=" + country, headers: headers).responseJSON { response in
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
                
                let lastUpdated = json["response"][0]["time"].stringValue
                let formatter = ISO8601DateFormatter()
                let date = formatter.date(from: lastUpdated)
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .short
                dateFormatter.timeStyle = .short
                dateFormatter.string(from: date!)
                
                let response = json["response"][0]
                
                let country = response["country"].stringValue
                
                let confirmed = response["cases"]["total"].intValue
                let newConfirmed = response["cases"]["new"].stringValue
                
                let active = response["cases"]["active"].intValue
                
                let critical = response["cases"]["critical"].intValue
                
                let deaths = response["deaths"]["total"].intValue
                let newDeaths = response["deaths"]["new"].stringValue
                
                let recovered = response["cases"]["recovered"].intValue
                
                let tests = response["tests"]["total"].intValue
                
                self.countryStatisticsData = CountryStatisticsData(country: country, lastUpdated: dateFormatter.string(from: date!), confirmed: confirmed, newConfirmed: newConfirmed, active: active, critical: critical, deaths: deaths, newDeaths: newDeaths, recovered: recovered, tests: tests)
            } else {
                
            }
        }
    }
}

extension Double {
    func getDateStringFromUnixTime(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.string(from: Date(timeIntervalSince1970: self))
    }
}
