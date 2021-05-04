import Foundation
import Nimble
import Quick
@testable import Stocks

class ExtendedFormatterServiceSpec: QuickSpec {
    override func spec() {
        describe("asCurrency") {
            it("formats a value as a currency using the current Locale") {
                let currencyFormatter = NumberFormatter()
                currencyFormatter.usesGroupingSeparator = true
                currencyFormatter.numberStyle = NumberFormatter.Style.currency
                currencyFormatter.locale = Locale(identifier: "en_US")

                let formatter = ExtendedFormatter()
                formatter.currencyFormatter = currencyFormatter

                expect(formatter.asCurrency(0.567, fractionDigits: 2)).to(equal("$0.57"))
                expect(formatter.asCurrency(1234, fractionDigits: 1)).to(equal("$1,234.0"))
                expect(formatter.asCurrency(1234.567, fractionDigits: 3)).to(equal("$1,234.567"))
            }

            it("formats a value as a currency using a given Currency") {
                let formatter = ExtendedFormatter(using: .USD)

                expect(formatter.asCurrency(0.567, fractionDigits: 2)).to(equal("US$0.57"))
                expect(formatter.asCurrency(1234, fractionDigits: 1)).to(equal("US$1,234.0"))
                expect(formatter.asCurrency(1234.567, fractionDigits: 3)).to(equal("US$1,234.567"))
            }
        }
    }
}
