//
//  PokemonListViewModelTests.swift
//  MyMVVMAppTests
//
//  Created by Willy Kim on 01/07/2021.
//

import XCTest
import RxBlocking
import Mockingjay
import Cuckoo

class PokemonListViewModelTests: XCTestCase {
    private var viewModel: PokemonListViewModel!

    override func setUp() {
        viewModel = PokemonListViewModel(networkingService: DataManager.shared.networkingService, navigator: Navigator(UIViewController()))
    }
    
    func test_InitialStateIsLoading() {
        XCTAssertEqual(try viewModel.stateSubject.value(), .loading)
    }
    
    func test_ShowPokemons_IfLoadingSucceed() {
        var pokemons: [Pokemon] = []
        let firstPokemon = Pokemon(id: 1, name: "bulbasaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334")
        let secondPokemon = Pokemon(id: 2, name: "ivysaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F62294490-1131-48DD-81E3-D328E54FAD12?alt=media&token=8aa9f6b8-3ee2-43a1-a48e-6e2218afc528")
        
        pokemons.append(firstPokemon)
        pokemons.append(secondPokemon)

        viewModel.onViewDidLoad()
        XCTAssertEqual(try viewModel.stateSubject.value(), .loaded(pokemons: pokemons))
    }
    
    func test_NavigateToDetails_IfTapped() {
        
    }

}
