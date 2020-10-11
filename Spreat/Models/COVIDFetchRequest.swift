//
//  COVIDFetchRequest.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 9.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class COVIDFetchRequest: ObservableObject {
    
    @Published var worldData: WorldData = defaultWorldData
    @Published var countriesData: [CountryData] = []
    
    init() {
        // Get the total numbers about COVID-19.
        getTotal()
        
        // Get the total numbers about COVID-19 for every country.
        getCountries()
    }
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
    ]
    
    // Get the total numbers about COVID-19.
    private func getTotal() {
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
                
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let critical = json[0]["critical"].intValue
                let recovered = json[0]["recovered"].intValue
                
                self.worldData = WorldData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
            } else {
                self.worldData = defaultWorldData
            }
        }
    }
    
    // Get the total numbers about COVID-19 for every country.
    private func getCountries() {
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=json", headers: headers).responseJSON { response in
            let result = response.value
            var allCountries: [CountryData] = []
            if result != nil {
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                for countryData in dataDictionary {
                    let country = countryData["country"] as? String ?? ""
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let confirmed = countryData["confirmed"] as? Int ?? 0
                    let deaths = countryData["deaths"] as? Int ?? 0
                    let critical = countryData["critical"] as? Int ?? 0
                    let recovered = countryData["recovered"] as? Int ?? 0
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, latitude: latitude, longitude: longitude)
                    
                    allCountries.append(countryObject)
                }
            }
            self.countriesData = allCountries.sorted(by: { $0.confirmed > $1.confirmed })
        }
    }
}
