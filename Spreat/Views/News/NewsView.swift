//
//  NewsView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 12.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    // Get news for the country.
    @ObservedObject var covidNewsFetchRequest = COVIDNewsFetchRequest()
    
    var body: some View {
        // NavigationView will cover the RecentsView.
        NavigationView {
            VStack {
                // Get the news.
                List {
                    ForEach(covidNewsFetchRequest.newsData, id: \.self) { news in
                        NewsItemView(covidNews: news)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
                // The title of the NavigationView.
                .navigationBarTitle("Spreat - \("news".localized())", displayMode: .inline)
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
