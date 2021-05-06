// MARK: - Mocks generated from file: Stocks/Helpers/ErrorLogging.swift at 2021-05-07 18:59:31 +0000


import Cuckoo
@testable import Stocks

import Foundation


 class MockErrorLogging: ErrorLogging, Cuckoo.ProtocolMock {
    
     typealias MocksType = ErrorLogging
    
     typealias Stubbing = __StubbingProxy_ErrorLogging
     typealias Verification = __VerificationProxy_ErrorLogging

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ErrorLogging?

     func enableDefaultImplementation(_ stub: ErrorLogging) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func logNonFatal(error: Error)  {
        
    return cuckoo_manager.call("logNonFatal(error: Error)",
            parameters: (error),
            escapingParameters: (error),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.logNonFatal(error: error))
        
    }
    
    
    
     func logHTTP(error: Error?, request: URLRequest, response: HTTPURLResponse)  {
        
    return cuckoo_manager.call("logHTTP(error: Error?, request: URLRequest, response: HTTPURLResponse)",
            parameters: (error, request, response),
            escapingParameters: (error, request, response),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.logHTTP(error: error, request: request, response: response))
        
    }
    

	 struct __StubbingProxy_ErrorLogging: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func logNonFatal<M1: Cuckoo.Matchable>(error: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Error)> where M1.MatchedType == Error {
	        let matchers: [Cuckoo.ParameterMatcher<(Error)>] = [wrap(matchable: error) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockErrorLogging.self, method: "logNonFatal(error: Error)", parameterMatchers: matchers))
	    }
	    
	    func logHTTP<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(error: M1, request: M2, response: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(Error?, URLRequest, HTTPURLResponse)> where M1.OptionalMatchedType == Error, M2.MatchedType == URLRequest, M3.MatchedType == HTTPURLResponse {
	        let matchers: [Cuckoo.ParameterMatcher<(Error?, URLRequest, HTTPURLResponse)>] = [wrap(matchable: error) { $0.0 }, wrap(matchable: request) { $0.1 }, wrap(matchable: response) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockErrorLogging.self, method: "logHTTP(error: Error?, request: URLRequest, response: HTTPURLResponse)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ErrorLogging: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func logNonFatal<M1: Cuckoo.Matchable>(error: M1) -> Cuckoo.__DoNotUse<(Error), Void> where M1.MatchedType == Error {
	        let matchers: [Cuckoo.ParameterMatcher<(Error)>] = [wrap(matchable: error) { $0 }]
	        return cuckoo_manager.verify("logNonFatal(error: Error)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func logHTTP<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(error: M1, request: M2, response: M3) -> Cuckoo.__DoNotUse<(Error?, URLRequest, HTTPURLResponse), Void> where M1.OptionalMatchedType == Error, M2.MatchedType == URLRequest, M3.MatchedType == HTTPURLResponse {
	        let matchers: [Cuckoo.ParameterMatcher<(Error?, URLRequest, HTTPURLResponse)>] = [wrap(matchable: error) { $0.0 }, wrap(matchable: request) { $0.1 }, wrap(matchable: response) { $0.2 }]
	        return cuckoo_manager.verify("logHTTP(error: Error?, request: URLRequest, response: HTTPURLResponse)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ErrorLoggingStub: ErrorLogging {
    

    

    
     func logNonFatal(error: Error)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func logHTTP(error: Error?, request: URLRequest, response: HTTPURLResponse)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Stocks/Services/PortfolioService.swift at 2021-05-07 18:59:31 +0000


import Cuckoo
@testable import Stocks

import Foundation


 class MockPortfolioService: PortfolioService, Cuckoo.ClassMock {
    
     typealias MocksType = PortfolioService
    
     typealias Stubbing = __StubbingProxy_PortfolioService
     typealias Verification = __VerificationProxy_PortfolioService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: PortfolioService?

     func enableDefaultImplementation(_ stub: PortfolioService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var errorLogger: ErrorLogging {
        get {
            return cuckoo_manager.getter("errorLogger",
                superclassCall:
                    
                    super.errorLogger
                    ,
                defaultCall: __defaultImplStub!.errorLogger)
        }
        
        set {
            cuckoo_manager.setter("errorLogger",
                value: newValue,
                superclassCall:
                    
                    super.errorLogger = newValue
                    ,
                defaultCall: __defaultImplStub!.errorLogger = newValue)
        }
        
    }
    

    

    
    
    
     override func fetch(completion: @escaping Completion)  {
        
    return cuckoo_manager.call("fetch(completion: @escaping Completion)",
            parameters: (completion),
            escapingParameters: (completion),
            superclassCall:
                
                super.fetch(completion: completion)
                ,
            defaultCall: __defaultImplStub!.fetch(completion: completion))
        
    }
    

	 struct __StubbingProxy_PortfolioService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var errorLogger: Cuckoo.ClassToBeStubbedProperty<MockPortfolioService, ErrorLogging> {
	        return .init(manager: cuckoo_manager, name: "errorLogger")
	    }
	    
	    
	    func fetch<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.ClassStubNoReturnFunction<(Completion)> where M1.MatchedType == Completion {
	        let matchers: [Cuckoo.ParameterMatcher<(Completion)>] = [wrap(matchable: completion) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPortfolioService.self, method: "fetch(completion: @escaping Completion)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PortfolioService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var errorLogger: Cuckoo.VerifyProperty<ErrorLogging> {
	        return .init(manager: cuckoo_manager, name: "errorLogger", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func fetch<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<(Completion), Void> where M1.MatchedType == Completion {
	        let matchers: [Cuckoo.ParameterMatcher<(Completion)>] = [wrap(matchable: completion) { $0 }]
	        return cuckoo_manager.verify("fetch(completion: @escaping Completion)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PortfolioServiceStub: PortfolioService {
    
    
     override var errorLogger: ErrorLogging {
        get {
            return DefaultValueRegistry.defaultValue(for: (ErrorLogging).self)
        }
        
        set { }
        
    }
    

    

    
     override func fetch(completion: @escaping Completion)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Stocks/ViewModels/PortfolioViewModelDelegate.swift at 2021-05-07 18:59:31 +0000


import Cuckoo
@testable import Stocks

import Foundation


 class MockPortfolioViewModelDelegate: PortfolioViewModelDelegate, Cuckoo.ProtocolMock {
    
     typealias MocksType = PortfolioViewModelDelegate
    
     typealias Stubbing = __StubbingProxy_PortfolioViewModelDelegate
     typealias Verification = __VerificationProxy_PortfolioViewModelDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: PortfolioViewModelDelegate?

     func enableDefaultImplementation(_ stub: PortfolioViewModelDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func didEncounterError()  {
        
    return cuckoo_manager.call("didEncounterError()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didEncounterError())
        
    }
    
    
    
     func didLoadModel()  {
        
    return cuckoo_manager.call("didLoadModel()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didLoadModel())
        
    }
    
    
    
     func willLoadModel()  {
        
    return cuckoo_manager.call("willLoadModel()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.willLoadModel())
        
    }
    

	 struct __StubbingProxy_PortfolioViewModelDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func didEncounterError() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPortfolioViewModelDelegate.self, method: "didEncounterError()", parameterMatchers: matchers))
	    }
	    
	    func didLoadModel() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPortfolioViewModelDelegate.self, method: "didLoadModel()", parameterMatchers: matchers))
	    }
	    
	    func willLoadModel() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockPortfolioViewModelDelegate.self, method: "willLoadModel()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PortfolioViewModelDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func didEncounterError() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("didEncounterError()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didLoadModel() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("didLoadModel()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func willLoadModel() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("willLoadModel()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PortfolioViewModelDelegateStub: PortfolioViewModelDelegate {
    

    

    
     func didEncounterError()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func didLoadModel()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func willLoadModel()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

