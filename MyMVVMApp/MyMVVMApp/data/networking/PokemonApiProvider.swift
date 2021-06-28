//
//  PokemonApiProvider.swift
//  MyMVVMApp
//
//  Created by Willy Kim on 23/06/2021.
//

import Foundation
import RxSwift
import Alamofire
import Moya

public enum Nintendo {
    case pokemons
}

extension Nintendo: TargetType {
    public var baseURL: URL {
        return URL(string: "http://demo5447186.mockable.io/")!
    }
    
    public var path: String {
        switch self {
        case .pokemons:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .pokemons:
            return .get
        }
    }
    
    public var sampleData: Data {
        // Replace this by real data for UNIT TEST
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var validationType: ValidationType {
      return .successCodes
    }

    public var headers: [String: String]? {
      return ["Content-Type": "application/json"]
    }
}

protocol NetworkingService {
    func getPokemons() -> Observable<[Pokemon]?>
    func getPokemonDetails(with id: Int) -> Observable<Pokemon?>
}

final class NetworkingApi: NetworkingService {
    
    private let mapper = PokemonMapper()

    func getPokemons() -> Observable<[Pokemon]?> {
//        let provider = MoyaProvider<Nintendo>()
//        return provider.rx.request(.pokemons)
//            .filterSuccessfulStatusCodes()
//            .mapDecodable([PokemonDto].self)
//            .map { self.mapper.map(dtos: $0)}
        
        let decoder = JSONDecoder()
        return filteredMoyaResponse().map { response -> [Pokemon] in
            let pokemons = try decoder.decode([PokemonDto].self, from: response.data)
            return self.mapper.map(dtos: pokemons)
        }
    }
    
    func getPokemonDetails(with id: Int) -> Observable<Pokemon?> {
        let decoder = JSONDecoder()
        return filteredMoyaResponse().map { response -> Pokemon? in
            let pokemons = try decoder.decode([PokemonDto].self, from: response.data)
            return self.mapper.mapDetails(dtos: pokemons, id: id)
        }
    }
    
    func filteredMoyaResponse() -> Observable<Response> {
        return Observable.create { observer in
            let provider = MoyaProvider<Nintendo>()
            provider.request(.pokemons) { result in
                switch result {
                case .success(let response):
                    do {
                        let filteredResponse = try response.filterSuccessfulStatusCodes()
                        observer.onNext(filteredResponse)
                        observer.onCompleted()
                    } catch {
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    
    /// Maps data received from the signal into a an object which implements the `Decodable` protocol
    /// If the conversion fails, the signal errors.
    func mapDecodable<T: Decodable>(_ type: T.Type) -> Single<T> {
        flatMap { Single.just(try $0.mapDecodable(type)) }
    }
}

private extension Response {
    
    /// Maps response into an object which implements the `Decodable` protocol
    /// If the conversion fails, throws decoding error
    func mapDecodable<T: Decodable>(_ type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: self.data)
    }
}
