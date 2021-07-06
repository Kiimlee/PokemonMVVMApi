import Cuckoo

import RxSwift


 class MockNetworkingService: NetworkingService, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkingService
    
     typealias Stubbing = __StubbingProxy_NetworkingService
     typealias Verification = __VerificationProxy_NetworkingService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkingService?

     func enableDefaultImplementation(_ stub: NetworkingService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getPokemons() -> Observable<[Pokemon]?> {
        
    return cuckoo_manager.call("getPokemons() -> Observable<[Pokemon]?>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getPokemons())
        
    }
    
    
    
     func getPokemonDetails(with id: Int) -> Observable<Pokemon?> {
        
    return cuckoo_manager.call("getPokemonDetails(with: Int) -> Observable<Pokemon?>",
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getPokemonDetails(with: id))
        
    }
    

	 struct __StubbingProxy_NetworkingService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getPokemons() -> Cuckoo.ProtocolStubFunction<(), Observable<[Pokemon]?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkingService.self, method: "getPokemons() -> Observable<[Pokemon]?>", parameterMatchers: matchers))
	    }
	    
	    func getPokemonDetails<M1: Cuckoo.Matchable>(with id: M1) -> Cuckoo.ProtocolStubFunction<(Int), Observable<Pokemon?>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkingService.self, method: "getPokemonDetails(with: Int) -> Observable<Pokemon?>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkingService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getPokemons() -> Cuckoo.__DoNotUse<(), Observable<[Pokemon]?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getPokemons() -> Observable<[Pokemon]?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getPokemonDetails<M1: Cuckoo.Matchable>(with id: M1) -> Cuckoo.__DoNotUse<(Int), Observable<Pokemon?>> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
	        return cuckoo_manager.verify("getPokemonDetails(with: Int) -> Observable<Pokemon?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkingServiceStub: NetworkingService {
    

    

    
     func getPokemons() -> Observable<[Pokemon]?>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Pokemon]?>).self)
    }
    
     func getPokemonDetails(with id: Int) -> Observable<Pokemon?>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<Pokemon?>).self)
    }
    
}


import Cuckoo


 class MockNavigatorProtocol: NavigatorProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = NavigatorProtocol
    
     typealias Stubbing = __StubbingProxy_NavigatorProtocol
     typealias Verification = __VerificationProxy_NavigatorProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NavigatorProtocol?

     func enableDefaultImplementation(_ stub: NavigatorProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func toPokemonDetails(with id: Int)  {
        
    return cuckoo_manager.call("toPokemonDetails(with: Int)",
            parameters: (id),
            escapingParameters: (id),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.toPokemonDetails(with: id))
        
    }
    

	 struct __StubbingProxy_NavigatorProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func toPokemonDetails<M1: Cuckoo.Matchable>(with id: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNavigatorProtocol.self, method: "toPokemonDetails(with: Int)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NavigatorProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func toPokemonDetails<M1: Cuckoo.Matchable>(with id: M1) -> Cuckoo.__DoNotUse<(Int), Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: id) { $0 }]
	        return cuckoo_manager.verify("toPokemonDetails(with: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NavigatorProtocolStub: NavigatorProtocol {
    

    

    
     func toPokemonDetails(with id: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

