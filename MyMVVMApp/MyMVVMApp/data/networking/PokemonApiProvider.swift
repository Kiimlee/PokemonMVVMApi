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
        switch self {
        case .pokemons:
            return URL(string: AppConfig.shared.pokemonApiBaseURL)!
        }
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

final class NetworkingApi: NetworkingService {
    private let targetType: TargetType!
    private let mapper = PokemonMapper()
    
    init(targetType: TargetType) {
        self.targetType = targetType
    }

    func getPokemons() -> Observable<[Pokemon]?> {
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
            provider.request(self.targetType as! Nintendo) { result in
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
