//
//  OnboardingCardView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 14.11.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct OnboardingCardView: View {
    
    // Checks whether the user is onboarding screen.
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    // Go to RecentsView() if the user taps the "Start" button.
    @State var goToRecents: Bool = false
    
    var card: OnboardingCardModel
    
    // Checks whether the image has been animated.
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(card.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .frame(width: 200, height: 200, alignment: .center)
                .scaleEffect(isAnimating ? 1.0 : 0.6)
            
            Text(card.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(card.description)
                .lineLimit(5)
                .multilineTextAlignment(.center)
                .font(.body)
                .foregroundColor(.white)
                .padding()
            
            Button(action: {
                isOnboarding = false
                goToRecents = true
            }) {
                HStack(spacing: 8) {
                    Text("start".localized())
                    
                    Image(systemName: "arrow.right.circle")
                        .imageScale(.large)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Capsule().strokeBorder(Color.white, lineWidth: 1.25))
            } //: Button
            .fullScreenCover(isPresented: $goToRecents) {
                RecentsView()
            }
            .accentColor(.white)
            
        }
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .padding()
    }
}

struct OnboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            OnboardingCardView(card: onboardingCardData[0])
        } else {
            // Fallback on earlier versions
        }
    }
}
