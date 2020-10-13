//
//  NewsItemView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 12.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct NewsItemView: View {
    var covidNews: COVIDNews
    
    var body: some View {
        VStack {
            HStack {
                Image("Spreat")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .leading)
                    .padding(.leading, 5)
                
                Text(covidNews.title)
                    .font(.subheadline)
                    .padding(.all, 10)
            }
            
            Text(covidNews.summary)
                .font(.footnote)
                .padding(.all, 10)
                .lineLimit(3)
            
            if covidNews.author != "" {
                Text(covidNews.author)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.all, 5)
            }
            
            Button("Read More") {
                UIApplication.shared.open(URL(string: self.covidNews.link)!)
            }
            .padding(.all, 10)
        }
        .overlay(RoundedRectangle(cornerRadius: 12)
        .stroke(Color.gray, lineWidth: 1))
        .padding(.all, 5)
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemView(covidNews: defaultCOVIDNews)
    }
}
