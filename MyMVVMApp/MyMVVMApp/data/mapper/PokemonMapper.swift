//
//  PokemonMapper.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 24/06/2021.
//

import Foundation

class PokemonMapper {
    
    func map(dtos: [PokemonDto]) -> [Pokemon] {
        return dtos.compactMap { self.map(dto: $0) }
    }

    
    func map(dto: PokemonDto) -> Pokemon? {
        let name = dto.name
        let imageUrl = dto.imageUrl
        return Pokemon(name: name, imageUrl: imageUrl)
    }
}
