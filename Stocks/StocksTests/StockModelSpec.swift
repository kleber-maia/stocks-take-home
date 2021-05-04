import Foundation
import Nimble
import Quick
@testable import Stocks

class StockModelServiceSpec: QuickSpec {
    override func spec() {
        describe("formatter") {
            it("returns a formatter configured to its Currency") {
                let model = StockModel(
                    ticker: "", name: "", currency: .USD, currentPriceCents: 0, quantity: nil, currentPriceTimestamp: 0
                )

                let formatter = model.formatter.currencyFormatter

                let expected = ExtendedFormatter(using: .USD).currencyFormatter

                expect(formatter.groupingSeparator).to(equal(expected.groupingSeparator))
                expect(formatter.decimalSeparator).to(equal(expected.decimalSeparator))
                expect(formatter.currencySymbol).to(equal(expected.currencySymbol))
            }
        }

        describe("isEqual") {
            context("when compared to am equal model") {
                it("should return true") {
                    let baseline = StockModel(
                        ticker: "TWTR",
                        name: "Twitter",
                        currency: .USD,
                        currentPriceCents: 3833,
                        quantity: 1,
                        currentPriceTimestamp: 123456
                    )

                    let comparison = StockModel(
                        ticker: "TWTR",
                        name: "Twitter",
                        currency: .USD,
                        currentPriceCents: 3833,
                        quantity: 1,
                        currentPriceTimestamp: 123456
                    )

                    expect(baseline.isEqual(comparison)).to(beTrue())
                }
            }

            context("when compared to a different model") {
                it("should return false") {
                    let baseline = StockModel(
                        ticker: "TWTR",
                        name: "Twitter",
                        currency: .USD,
                        currentPriceCents: 3833,
                        quantity: 1,
                        currentPriceTimestamp: 123456
                    )

                    let comparison = StockModel(
                        ticker: "AAPL",
                        name: "Apple",
                        currency: .USD,
                        currentPriceCents: 1234,
                        quantity: 0,
                        currentPriceTimestamp: 123456
                    )

                    expect(baseline.isEqual(comparison)).toNot(beTrue())
                }
            }

            context("when compared to another type") {
                it("should return false") {
                    let baseline = StockModel(
                        ticker: "TWTR",
                        name: "Twitter",
                        currency: .USD,
                        currentPriceCents: 3833,
                        quantity: 1,
                        currentPriceTimestamp: 123456
                    )

                    let comparison = [StockModel]()

                    expect(baseline.isEqual(comparison)).toNot(beTrue())
                }
            }
        }

        describe("sort") {
            it("returns a sorted array of stocks by name") {
                let first = StockModel(
                    ticker: "", name: "A", currency: .USD, currentPriceCents: 0, quantity: nil, currentPriceTimestamp: 0
                )
                let last = StockModel(
                    ticker: "", name: "B", currency: .USD, currentPriceCents: 0, quantity: nil, currentPriceTimestamp: 0
                )

                let original = [last, first]

                let expected = [first, last]

                expect(original.sorted).to(equal(expected))
            }
        }

        describe("owns") {
            it("returns an array of stocks where quantity > 0") {
                let owned = StockModel(
                    ticker: "", name: "A", currency: .USD, currentPriceCents: 0, quantity: 1, currentPriceTimestamp: 0
                )
                let watching = StockModel(
                    ticker: "", name: "B", currency: .USD, currentPriceCents: 0, quantity: nil, currentPriceTimestamp: 0
                )

                let original = [owned, watching]

                let expected = [owned]

                expect(original.owns).to(equal(expected))
            }
        }

        describe("watching") {
            it("returns an array of stocks where quantity == 0") {
                let owned = StockModel(
                    ticker: "", name: "A", currency: .USD, currentPriceCents: 0, quantity: 1, currentPriceTimestamp: 0
                )
                let watching = StockModel(
                    ticker: "", name: "B", currency: .USD, currentPriceCents: 0, quantity: nil, currentPriceTimestamp: 0
                )

                let original = [owned, watching]

                let expected = [watching]

                expect(original.watching).to(equal(expected))
            }
        }
    }
}
