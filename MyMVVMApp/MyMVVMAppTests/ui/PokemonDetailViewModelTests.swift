//
//  PokemonDetailViewModelTests.swift
//  MyMVVMAppTests
//
//  Created by Willy Kim on 02/07/2021.
//

import XCTest
import RxBlocking
import Mockingjay
import Cuckoo

class PokemonDetailViewModelTests: XCTestCase {
    private var sut: PokemonDetailsViewModel!
    var mockPokemonApiProvider: MockNetworkingService!
    var mockNavigator: MockNavigatorProtocol!
    
    // Il faut mocker le service/id en ajoutant Cuckoo
    override func setUp() {
        sut = PokemonDetailsViewModel(networkingService: DataManager.shared.networkingService, pokemonId: 1)
        mockPokemonApiProvider = MockNetworkingService()
        mockNavigator = MockNavigatorProtocol()
    }
    
    func test_InitialStateIsLoading() {
        XCTAssertEqual(try sut.stateSubject.value(), .loading)
    }

    func test_ShowPokemons_IfLoadingSucceed() {
        let expected = Pokemon(id: 1, name: "bulbasaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334")

        sut.onViewDidLoad()
        XCTAssertEqual(try sut.stateSubject.value(), .loaded(pokemon: expected))
    }
}
