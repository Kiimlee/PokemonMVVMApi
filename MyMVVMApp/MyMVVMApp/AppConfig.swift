//
//  AppConfig.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 29/06/2021.
//

import Foundation

class AppConfig {
    
    static let shared = AppConfig()
    
    // MARK: - App
    
    @BundleInfo("CFBundleVersion")
    var buildNumber: String
    
    @BundleInfo("CFBundleShortVersionString")
    var buildVersion: String
    
    // MARK: - API
    
    @BundleInfo("POKEMON_API_URL")
    var pokemonApiBaseURL: String
}

@propertyWrapper
struct BundleInfo {
    private let key: String
    private let bundle: Bundle
    
    init(_ key: String, bundle: Bundle = Bundle.main) {
        self.key = key
        self.bundle = bundle
    }
    
    var wrappedValue: String {
        guard let value = (bundle.infoDictionary?[key] as? String) else {
            fatalError("Missing value for key \(key)")
        }
        
        return value
    }
}
