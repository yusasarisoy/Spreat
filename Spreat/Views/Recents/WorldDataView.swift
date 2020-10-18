//
//  WorldDataView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 10.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct WorldDataView: View {
    
    var worldData: WorldData
    
    var body: some View {
        VStack {
            HStack {
                WorldDataCard(number: worldData.confirmed.formatNumber(), name: "confirmed".localized(), color: .gray)
                WorldDataCard(number: worldData.critical.formatNumber(), name: "critical".localized(), color: .yellow)
            }
            HStack {
                WorldDataCard(number: worldData.deaths.formatNumber(), name: "deaths".localized(), color: .red)
                WorldDataCard(number: String(format: "%.2f", worldData.fatalityRate) + "%", name: "fatality_rate".localized(), color: .red)
            }
            HStack {
                WorldDataCard(number: worldData.recovered.formatNumber(), name: "recovered".localized(), color: .green)
                WorldDataCard(number: String(format: "%.2f", worldData.recoveryRate) + "%", name: "recovery_rate".localized(), color: .green)
            }
        }
        .frame(height: 200)
        .padding()
    }
}

struct WorldDataView_Previews: PreviewProvider {
    static var previews: some View {
        WorldDataView(worldData: defaultWorldData)
    }
}
