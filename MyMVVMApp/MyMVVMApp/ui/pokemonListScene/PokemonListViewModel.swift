//
//  PokemonListViewModel.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 23/06/2021.
//

import RxSwift
import RxCocoa

final class PokemonListViewModel: Subscribable {
    
    // MARK: Constants
    enum ResultState {
        case loading
        case loaded(pokemons: [Pokemon])
    }

    // Inputs
    let stateSubject = BehaviorSubject<ResultState>(value: .loading)

    // Outputs
    private let networkingService: NetworkingService
    
    init(networkingService: NetworkingService) {
        self.networkingService = networkingService
    }
    
    func onViewDidLoad() {
        loadPokemons()
    }

    // MARK: Private
    
    private func loadPokemons() {
        stateSubject.onNext(.loading)
        sub(networkingService.getPokemons().subscribe(onNext: { pokemons in
            self.stateSubject.onNext(.loaded(pokemons: pokemons ?? []))
        }, onError: { _ in
            print("error")
        }))
    }
}
