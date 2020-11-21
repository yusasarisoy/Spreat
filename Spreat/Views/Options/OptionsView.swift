//
//  OptionsView.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 13.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import SwiftUI
import Localize_Swift

@available(iOS 14.0, *)
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
            VStack {
                Form {
                    Section {
                        Text("change_language".localized())
                            .accessibility(label: Text("change_language".localized()))
                        Picker("", selection: $selectedLanguageIndex) {
                            ForEach(0..<languages.count) {
                                Text(self.languages[$0])
                                    .accessibility(label: Text(self.languages[$0]))
                            } //: ForEach
                        } //: Picker
                        .pickerStyle(WheelPickerStyle())
                        Button(action: {
                            self.optionsManager.handleLanguage(language: self.languages[self.selectedLanguageIndex])
                            NotificationCenter.default.addObserver(self, selector: Selector(("setText")), name: NSNotification.Name(rawValue: LCLLanguageChangeNotification), object: nil)
                            self.showRecents.toggle()
                        }) { //: Button
                            Text("ok".localized())
                                .accessibility(label: Text("ok".localized()))
                        }
                        .fullScreenCover(isPresented: $showRecents) {
                            RecentsView()
                        }
                    } //: Section
                    OptionsLabelView(labelText: "Spreat", labelImage: "apps.iphone")
                    OptionsRowView(title: "developer".localized(), content: "Yuşa Sarısoy")
                    OptionsRowView(title: "compatibility".localized(), content: "iOS 14")
                    OptionsRowView(title: "Twitter", linkLabel: "@yusasarisoy", linkDestination: "twitter.com/yusasarisoy")
                    OptionsRowView(title: "SwiftUI", content: "2.0")
                    OptionsRowView(title: "Version", content: "1.0")
                } //: Form
                .navigationBarTitle("options".localized())
                .navigationBarTitleDisplayMode(.inline)
            } // VStack
        } //: NavigationView
    }
}

@available(iOS 14.0, *)
struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
            .previewDevice("iPhone 12 mini")
    }
}
