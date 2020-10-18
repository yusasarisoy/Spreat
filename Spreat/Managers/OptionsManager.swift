//
//  OptionsManager.swift
//  Spreat
//
//  Created by Yuşa Sarısoy on 18.10.2020.
//  Copyright © 2020 Yuşa Sarısoy. All rights reserved.
//

import Foundation
import Localize_Swift

struct OptionsManager {
    
    func handleLanguage(language: String) {
        switch language {
        case "English":
            Localize.setCurrentLanguage("en")
        case "Español":
            Localize.setCurrentLanguage("es")
        case "Français":
            Localize.setCurrentLanguage("fr")
        case "Deutsch":
            Localize.setCurrentLanguage("de")
        case "Italiano":
            Localize.setCurrentLanguage("it")
        case "Nederlands":
            Localize.setCurrentLanguage("ne")
        case "Türkçe":
            Localize.setCurrentLanguage("tr")
        case "русский":
            Localize.setCurrentLanguage("ru")
        case "日本語":
            Localize.setCurrentLanguage("jp")
        case "عربى":
            Localize.setCurrentLanguage("ar")
        default:
            Localize.setCurrentLanguage("en")
        }
    }
}
