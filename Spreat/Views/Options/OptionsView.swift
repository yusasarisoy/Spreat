//
//  OptionsView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 13.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI
import Localize_Swift

struct OptionsView: View {
    
    // Show the "RecentsView".
    @State var showRecents = false
    
    var optionsManager = OptionsManager()
    
    private let languages: [String] = ["English", "Español", "Français", "Deutsch", "Italiano", "Nederlands", "Türkçe", "русский", "日本語", "عربى"]
    
    // Store the selected language from the picker.
    @State private var selectedLanguageIndex: Int = 0
    @State private var selectedLanguage: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("change_language".localized())
                    Picker("", selection: $selectedLanguageIndex) {
                        ForEach(0..<languages.count) {
                            Text(self.languages[$0])
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    
                    if #available(iOS 14.0, *) {
                        Button(action: {
                            self.optionsManager.handleLanguage(language: self.languages[self.selectedLanguageIndex])
                            NotificationCenter.default.addObserver(self, selector: Selector(("setText")), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
                            self.showRecents.toggle()
                        }) {
                            Text("ok".localized())
                        }
                        .fullScreenCover(isPresented: $showRecents) {
                            RecentsView()
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            .navigationBarTitle("options".localized())
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
