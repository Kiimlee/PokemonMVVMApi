//
//  PokemonDetailsViewModel.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 28/06/2021.
//

import RxSwift
import RxCocoa

final class PokemonDetailsViewModel: Subscribable {
    
    // MARK: Constants

    enum ResultState: Equatable {
        case loading
        case loaded(pokemon: Pokemon?)
    }

    // Inputs
    let stateSubject = BehaviorSubject<ResultState>(value: .loading)

    // Outputs
    private let networkingService: NetworkingService
    private let pokemonId: Int
    
    init(networkingService: NetworkingService, pokemonId: Int) {
        self.networkingService = networkingService
        self.pokemonId = pokemonId
    }
    
    func onViewDidLoad() {
        loadPokemons()
    }

    // MARK: Private
    
    private func loadPokemons() {
        stateSubject.onNext(.loading)
        sub(networkingService.getPokemonDetails(with: pokemonId).subscribe(onNext: { pokemon in
            self.stateSubject.onNext(.loaded(pokemon: pokemon))
        }, onError: { _ in
            print("error")
        }))
    }
}
