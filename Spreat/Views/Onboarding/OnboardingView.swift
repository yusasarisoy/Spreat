//
//  OnboardingView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 14.11.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    // Holds the card index data.
    @State var selectedCard: Int = 0
    
    var body: some View {
        if #available(iOS 14.0, *) {
            TabView(selection: $selectedCard) {
                ForEach(0..<onboardingCardData.count) { index in
                    OnboardingCardView(card: onboardingCardData[index]).tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(Color("AccentColor"))
            .edgesIgnoringSafeArea(.all)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
