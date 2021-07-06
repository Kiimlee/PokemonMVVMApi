//
//  PokemonApiProviderProtocol.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 30/06/2021.
//

import RxSwift

protocol NetworkingService {
    func getPokemons() -> Observable<[Pokemon]?>
    func getPokemonDetails(with id: Int) -> Observable<Pokemon?>
}
