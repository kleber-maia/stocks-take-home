//
//  StocksTests.swift
//  StocksTests
//
//  Created by Kleber Maia on 5/3/21.
//

import Cuckoo
import Nimble
import Quick
@testable import Stocks

class StocksSpec: QuickSpec {
    override func spec() {
        afterEach {
            // Put teardown code here.
        }

        beforeEach {
            // Put setup code here.
        }

        describe("method or property") {
            context("when some case scenario") {
                it("should do, return something") {
                    /*
                     let mock = MockMyProtocol()
                     stub(mock) { stub in
                         stub.testProperty.get.thenReturn(true)
                         stub.testMethod().thenDoNothing()
                     }

                     mock.testMethod()
                     expect(mock.testProperty).to(equal(true))

                     verify(mock).testMethod()
                     verify(mock).testProperty.get()
                     */
                }
            }
        }
    }
}
