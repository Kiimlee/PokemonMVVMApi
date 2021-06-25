//
//  PokemonDto.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 24/06/2021.
//

struct PokemonDto: Codable {
    let attack: Int
    let defense: Int
    let description: String
//    let evolutionChain: [EvolutionChainDto]
    let height: Int
    let id: Int
    let imageUrl: String
    let name: String
    let type: String
    let weight: Int
}
