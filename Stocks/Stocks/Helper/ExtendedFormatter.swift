import Foundation

/// Helper for number formatting.
class ExtendedFormatter {
    var currencyFormatter = NumberFormatter()

    init() {
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        currencyFormatter.locale = Locale.current
    }

    /**
     Formats the given `value` using the current locale currency format.
     */
    func asCurrency(_ value: Double, fractionDigits: Int? = 2) -> String? {
        currencyFormatter.maximumFractionDigits = fractionDigits!
        currencyFormatter.minimumFractionDigits = fractionDigits!

        return currencyFormatter.string(from: NSNumber(value: value))
    }
}
