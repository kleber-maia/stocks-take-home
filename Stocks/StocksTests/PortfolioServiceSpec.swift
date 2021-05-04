import Cuckoo
import Foundation
import OHHTTPStubs
import OHHTTPStubsSwift
import Nimble
import Quick
@testable import Stocks

class PortfolioServiceSpec: QuickSpec {
    override func spec() {
        afterEach {
            HTTPStubs.removeAllStubs()
        }

        describe("fetch") {
            context("when request succeeds") {
                it("should return the expected result") {
                    stub(condition: isHost("storage.googleapis.com")) { _ in
                        .init(
                            fileAtPath: OHPathForFile("stocks.json", PortfolioServiceSpec.self)!,
                            statusCode: 200,
                            headers: nil
                        )
                    }

                    let service = PortfolioService()

                    waitUntil(timeout: .milliseconds(500)) { done in
                        service.fetch { result in
                            expect(try! result.get()).toNot(throwError())
                            done()
                        }
                    }
                }
            }

            context("when there's a server error") {
                it("should return and log an HTTP error") {
                    stub(condition: isHost("storage.googleapis.com")) { _ in
                        .init(data: Data(), statusCode: 500, headers: nil)
                    }

                    let mock = MockErrorLogging()
                    stub(mock) { stub in
                        stub.logHTTP(error: any(), request: any(), response: any()).thenDoNothing()
                    }

                    let service = PortfolioService()
                    service.errorLogger = mock

                    waitUntil(timeout: .milliseconds(500)) { done in
                        service.fetch { result in
                            do {
                                let expected = PortfolioService.ServiceError.requestError(nil)
                                expect(try result.get()).to(throwError(expected))

                                verify(mock).logHTTP(error: any(), request: any(), response: any())

                                done()
                            } catch { /* XXX: ignore Xcode warning */ }
                        }
                    }
                }
            }

            context("when invalid data is returned") {
                it("should return and log a non fatal error") {
                    stub(condition: isHost("storage.googleapis.com")) { _ in
                        .init(data: Data(), statusCode: 200, headers: nil)
                    }

                    let mock = MockErrorLogging()
                    stub(mock) { stub in
                        stub.logNonFatal(error: any()).thenDoNothing()
                    }

                    let service = PortfolioService()
                    service.errorLogger = mock

                    waitUntil(timeout: .milliseconds(500)) { done in
                        service.fetch { result in
                            do {
                                let expected = PortfolioService.ServiceError.invalidData(nil)
                                expect(try result.get()).to(throwError(expected))

                                verify(mock).logNonFatal(error: any())

                                done()
                            } catch { /* XXX: ignore Xcode warning */ }
                        }
                    }
                }
            }
        }
    }
}
