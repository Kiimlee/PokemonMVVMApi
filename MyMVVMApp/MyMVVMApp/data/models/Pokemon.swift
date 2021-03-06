//
//  Pokemon.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 23/06/2021.
//

struct Pokemon: Decodable, Equatable {
    let id: Int
    let name: String
    let imageUrl: String
}
