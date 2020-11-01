//
//  COVIDNewsFetchRequest.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 12.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Localize_Swift

class COVIDNewsFetchRequest: ObservableObject {
    
    @Published var covidNews: COVIDNews?
    @Published var newsData: [COVIDNews] = []
    
    init() {
        getNewsForTheCountry()
    }
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-news.p.rapidapi.com",
        "x-rapidapi-key": "99ce4b6f4amshe0c43f8efa1f864p17c934jsn12a890f88045"
    ]
    
    // Get the total numbers about COVID-19.
    func getNewsForTheCountry() {
        AF.request("https://covid-19-news.p.rapidapi.com/v1/covid?lang=en&media=True&q=covid))", headers: headers).responseJSON { response in
            let result = response.data
            
            var allNews: [COVIDNews] = []
            
            if result != nil {
                let json = JSON(result!)
                
                for item in json["articles"].arrayValue {
                    
                    self.covidNews = COVIDNews(title: item["title"].stringValue, summary: item["summary"].stringValue, link: item["link"].stringValue, author: item["author"].stringValue)
                    allNews.append(self.covidNews!)
                }
            }
             self.newsData = allNews
        }
    }
}
