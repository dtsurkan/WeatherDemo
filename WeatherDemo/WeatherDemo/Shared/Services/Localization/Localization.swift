//
//  Localization.swift
//  WeatherDemo
//
//  Created by Dima Tsurkan on 9/22/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

enum LanguageName: String {
    case undefined
    case en
    case ru
}

let DynamicLanguageServiceDidDetectLanguageSwitchNotificationKey = "DynamicLanguageServiceDidDetectLanguageSwitchNotificationKey"

func dynamicLocalizableString(_ key: String) -> String {
    return LanguageService.service.dynamicLocalizedString(key)
}

class LanguageService {
    
    private struct Defaults {
        static let keyCurrentLanguage = "KeyCurrentLanguage"
    }
    
    static let service:LanguageService = LanguageService()
    
    var languageCode: String {
        get {
            return language.rawValue
        }
    }
    
    var currentLanguage:LanguageName {
        get {
            var currentLanguage = UserDefaults.standard.object(forKey: Defaults.keyCurrentLanguage)
            if currentLanguage == nil {
                currentLanguage = Locale.preferredLanguages[0]
                
            }
            if var currentLanguage = currentLanguage as? String,
                let lang =  LanguageName(rawValue: currentLanguage.truncate(length: 2)) { //LanguageName(rawValue: currentLanguage.truncatedBy(by:2)) {
                return lang
            }
            return LanguageName.en
        }
    }
    
    var defaultLanguageForLearning:LanguageName {
        get {
            var language: LanguageName = .en
            if currentLanguage == language {
                language = .en
            }
            return language
        }
    }
    
    func switchToLanguage(_ lang:LanguageName) {
        language = lang
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: DynamicLanguageServiceDidDetectLanguageSwitchNotificationKey), object: nil)
    }
    
    func clearLanguages() {
        UserDefaults.standard.setValue(nil, forKey:Defaults.keyCurrentLanguage)
        print(UserDefaults.standard.synchronize())
    }
    
    private var localeBundle:Bundle?
    
    fileprivate var language: LanguageName = LanguageName.en {
        didSet {
            let currentLanguage = language.rawValue
            UserDefaults.standard.setValue(currentLanguage, forKey:Defaults.keyCurrentLanguage)
            UserDefaults.standard.synchronize()
            
            setLocaleWithLanguage(currentLanguage)
        }
    }
    
    // MARK: - LifeCycle
    
    private init() {
        prepareDefaultLocaleBundle()
    }
    
    //MARK: - Private
    
    fileprivate func dynamicLocalizedString(_ key: String) -> String {
        var localizedString = key
        if let bundle = localeBundle {
            localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        } else {
            localizedString = NSLocalizedString(key, comment: "")
        }
        return localizedString
    }
    
    private func prepareDefaultLocaleBundle() {
        var currentLanguage = UserDefaults.standard.object(forKey: Defaults.keyCurrentLanguage)
        if currentLanguage == nil {
            currentLanguage = Locale.preferredLanguages[0]
        }
        
        if let currentLanguage = currentLanguage as? String {
            updateCurrentLanguageWithName(currentLanguage)
        }
    }
    
    private func updateCurrentLanguageWithName(_ languageName: String) {
        if let lang = LanguageName(rawValue: languageName) {
            language = lang
        }
    }
    
    private func setLocaleWithLanguage(_ selectedLanguage: String) {
        if let pathSelected = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj"),
            let bundleSelected = Bundle(path: pathSelected)  {
            localeBundle = bundleSelected
        } else if let pathDefault = Bundle.main.path(forResource: LanguageName.en.rawValue, ofType: "lproj"),
            let bundleDefault = Bundle(path: pathDefault) {
            localeBundle = bundleDefault
        }
    }
}
