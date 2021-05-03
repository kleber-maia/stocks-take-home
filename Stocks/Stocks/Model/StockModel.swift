import Foundation

/// Represents a single stock in the user's portfolio and/or watch list.
class StockModel: NSObject, Codable {
    let ticker: String
    let name: String
    let currency: Currency
    let currentPriceCents: Int
    let quantity: Int?
    let currentPriceTimestamp: TimeInterval

    init(
        ticker: String,
        name: String,
        currency: Currency,
        currentPriceCents: Int,
        quantity: Int?,
        currentPriceTimestamp: TimeInterval
    ) {
        self.ticker = ticker
        self.name = name
        self.currency = currency
        self.currentPriceCents = currentPriceCents
        self.quantity = quantity
        self.currentPriceTimestamp = currentPriceTimestamp
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let stock = object as? StockModel else { return false }

        return ticker == stock.ticker &&
            name == stock.name &&
            currency == stock.currency &&
            currentPriceCents == stock.currentPriceCents &&
            quantity == stock.quantity &&
            currentPriceTimestamp == currentPriceTimestamp
    }
}
