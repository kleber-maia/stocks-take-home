import Foundation
import Nimble
import Quick
@testable import Stocks

class StocksModelSpec: QuickSpec {
    override func spec() {
        describe("init") {
            context("when valid JSON data is provided") {
                it("should successfully decode") {
                    let jsonData = try! Data(
                        contentsOf: Bundle(for: StocksModelSpec.self)
                            .url(forResource: "stocks", withExtension: "json")!
                    )

                    let model = try! StocksModel(jsonData: jsonData)

                    expect(model.stocks).to(
                        equal(
                            [
                                StockModel(
                                    ticker: "TWTR",
                                    name: "Twitter, Inc.",
                                    currency: .USD,
                                    currentPriceCents: 3833,
                                    quantity: 1,
                                    currentPriceTimestamp: 1597942580
                                )
                            ]
                        )
                    )
                }
            }

            context("when valid, empty JSON data is provided") {
                it("should successfully decode") {
                    let jsonData = try! Data(
                        contentsOf: Bundle(for: StocksModelSpec.self)
                            .url(forResource: "stocks_empty", withExtension: "json")!
                    )

                    let model = try! StocksModel(jsonData: jsonData)

                    expect(model.stocks).to(equal([]))
                }
            }

            context("when malformed JSON data is provided") {
                it("should throw an error") {
                    let jsonData = try! Data(
                        contentsOf: Bundle(for: StocksModelSpec.self)
                            .url(forResource: "stocks_malformed", withExtension: "json")!
                    )

                    expect(try StocksModel(jsonData: jsonData)).to(throwError())
                }
            }
        }
    }
}
