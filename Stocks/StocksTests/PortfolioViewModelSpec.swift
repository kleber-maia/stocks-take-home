import Cuckoo
import Foundation
import OHHTTPStubs
import OHHTTPStubsSwift
import Nimble
import Quick
@testable import Stocks

class PortfolioViewModelSpec: QuickSpec {
    override func spec() {
        describe("bootstrap") {
            it("triggers an initial fetch") {
                let mock = MockPortfolioService()
                stub(mock) { stub in
                    stub.fetch(completion: any()).thenDoNothing()
                }

                let viewModel = PortfolioViewModel(portfolioService: mock)

                viewModel.bootstrap()

                verify(mock).fetch(completion: any())
            }
        }

        describe("fetchModel") {
            context("when it succeeds") {
                it("should notify the delegate") {
                    let mockService = MockPortfolioService()
                    stub(mockService) { stub in
                        stub.fetch(completion: any()).then { completion in
                            let model = try! PortfolioModel(
                                jsonData: try! Data(
                                    contentsOf: Bundle(for: PortfolioModelSpec.self)
                                        .url(forResource: "stocks", withExtension: "json")!
                                )
                            )
                            completion(.success(model))
                        }
                    }

                    let mockDelegate = MockPortfolioViewModelDelegate()
                    stub(mockDelegate) { stub in
                        stub.willLoadModel().thenDoNothing()
                    }

                    let viewModel = PortfolioViewModel(portfolioService: mockService)
                    viewModel.delegate = mockDelegate

                    waitUntil(timeout: .milliseconds(500)) { done in
                        viewModel.fetchModel()

                        verify(mockService).fetch(completion: any())
                        verify(mockDelegate).willLoadModel()

                        stub(mockDelegate) { stub in stub.didLoadModel().then { done() } }
                    }
                }
            }

            context("when it fails") {
                it("should notify the delegate") {
                    let mockService = MockPortfolioService()
                    stub(mockService) { stub in
                        stub.fetch(completion: any()).then { completion in
                            completion(.failure(NSError()))
                        }
                    }

                    let mockDelegate = MockPortfolioViewModelDelegate()
                    stub(mockDelegate) { stub in
                        stub.willLoadModel().thenDoNothing()
                    }

                    let viewModel = PortfolioViewModel(portfolioService: mockService)
                    viewModel.delegate = mockDelegate

                    waitUntil(timeout: .milliseconds(500)) { done in
                        viewModel.fetchModel()

                        verify(mockService).fetch(completion: any())
                        verify(mockDelegate).willLoadModel()

                        stub(mockDelegate) { stub in stub.didEncounterError().then { done() } }
                    }
                }
            }
        }
    }
}
