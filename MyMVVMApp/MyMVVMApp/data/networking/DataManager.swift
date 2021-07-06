//
//  DataManager.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 29/06/2021.
//

class DataManager {
    static let shared = DataManager()
    
    lazy var networkingService = NetworkingApi(targetType: Nintendo.pokemons)
}
