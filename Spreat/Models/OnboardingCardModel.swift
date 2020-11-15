//
//  OnboardingCardModel.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 14.11.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import Foundation

struct OnboardingCardModel: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var description: String
}

var onboardingCardData: [OnboardingCardModel] = [
    OnboardingCardModel(image: "Statistics", title: "statisticsTitle".localized(), description: "statisticsDescription".localized()),
    OnboardingCardModel(image: "WorldMap", title: "worldMapTitle".localized(), description: "worldMapDescription".localized()),
    OnboardingCardModel(image: "Newspaper", title: "newsTitle".localized(), description: "newsDescription".localized())
]
