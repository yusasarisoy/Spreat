//
//  COVIDModel.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 9.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import Foundation

struct WorldData {
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100.0 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveryRate: Double {
        return (100.0 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryData {
    let country: String
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    let latitude: Double
    let longitude: Double
    
    var fatalityRate: Double {
        return (100.0 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveryRate: Double {
        return (100.0 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryStatisticsData {
    let country: String
    let lastUpdated: String
    let confirmed: Int
    let newConfirmed: String
    let active: Int
    let critical: Int
    let deaths: Int
    let newDeaths: String
    let recovered: Int
    let tests: Int
    
    var fatalityRate: Double {
        return (100.0 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveryRate: Double {
        return (100.0 * Double(recovered)) / Double(confirmed)
    }
}

struct COVIDNews: Hashable {
    let title: String
    let summary: String
    let link: String
    let author: String
}

let defaultWorldData = WorldData(confirmed: 0, critical: 0, deaths: 0, recovered: 0)
let defaultCountryData = CountryData(country: "Unknown", confirmed: 0, critical: 0, deaths: 0, recovered: 0, latitude: 0.0, longitude: 0.0)
let defaultCOVIDNews = COVIDNews(title: "Title", summary: "Summary", link: "Link", author: "Author")
