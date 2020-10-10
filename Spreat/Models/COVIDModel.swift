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
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let latitude: Double
    let longitude: Double
    
    var fatalityRate: Double {
        return (100.0 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveryRate: Double {
        return (100.0 * Double(recovered)) / Double(confirmed)
    }
}

let defaultWorldData = WorldData(confirmed: 0, critical: 0, deaths: 0, recovered: 0)
let defaultCountryData = CountryData(country: "Unknown", confirmed: 0, critical: 0, deaths: 0, recovered: 0, latitude: 0.0, longitude: 0.0)
