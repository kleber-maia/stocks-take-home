import Foundation

/// Represents a single stock in the user's portfolio and/or watch list.
class StockModel: NSObject, Codable {
    let ticker: String
    let name: String
    let currency: Currency
    let currentPriceCents: Int
    let quantity: Int?
    let currentPriceTimestamp: TimeInterval

    var formattedCurrentPrice: String? {
        formatter.asCurrency(Double(currentPriceCents) / 100.0)
    }
    lazy var formatter = ExtendedFormatter(using: self.currency)

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

extension Array where Element == StockModel {
    func owns() -> [StockModel] {
        filter { $0.quantity ?? 0 > 0 }
    }

    func sorted() -> [StockModel] {
        sorted { $0.name < $1.name }
    }

    func watching() -> [StockModel] {
        filter { $0.quantity ?? 0 == 0 }
    }
}
