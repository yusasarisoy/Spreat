//
//  MapContainerView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 10.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    @ObservedObject var COVIDFetch = COVIDFetchRequest()
    
    var body: some View {
        MapView(countryData: $COVIDFetch.countriesData)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
