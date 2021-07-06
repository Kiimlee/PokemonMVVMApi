//
//  PokemonApiProviderTests.swift
//  MyMVVMAppUITests
//
//  Created by Willy Kim on 30/06/2021.
//

import XCTest
import RxBlocking
import Mockingjay

class PokemonApiProviderTests: XCTestCase {
    
    private var sut: NetworkingService!
    
    override func setUp() {
        sut = NetworkingApi(targetType: Nintendo.pokemons)
    }
    
    // Dépendance forte du lien de l'API a résoudre, taille des objets à comparer
    func test_GetPokemons() {
        func matcher(request: URLRequest) -> Bool {
            XCTAssertEqual(request.url?.urlWithoutParameters, "http://demo5447186.mockable.io/")
            XCTAssertEqual(request.httpMethod, HTTPMethod.get.description)
            return true
        }

        stub(matcher, jsonData(loadStub(named: "pokemons")))
        
        var expected: [Pokemon] = []
        let firstPokemon = Pokemon(id: 1, name: "bulbasaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334")
        let secondPokemon = Pokemon(id: 2, name: "ivysaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F62294490-1131-48DD-81E3-D328E54FAD12?alt=media&token=8aa9f6b8-3ee2-43a1-a48e-6e2218afc528")
        
        expected.append(firstPokemon)
        expected.append(secondPokemon)
                
        let result = try! sut.getPokemons().toBlocking().first()
        XCTAssertEqual(result, expected)
    }
    
    func test_GetPokemonWithId() {
                
        func matcher(request: URLRequest) -> Bool {
            XCTAssertEqual(request.url?.urlWithoutParameters, "http://demo5447186.mockable.io/")
            XCTAssertEqual(request.httpMethod, HTTPMethod.get.description)
            return true
        }
        
        stub(matcher, jsonData(loadStub(named: "pokemons")))

        let expected = Pokemon(id: 1, name: "bulbasaur", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334")
                
        let result = try! sut.getPokemonDetails(with: 1).toBlocking().first()

        XCTAssertEqual(result, expected)
    }
}
