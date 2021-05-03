import Foundation

/// Represents a collection of stocks in the user's portfolio and/or watch list.
struct StocksModel: Codable {
    let stocks: [StockModel]

    /// Initializes de model from the provided `jsonData`.
    ///
    /// - Parameter jsonData: expected format:
    /// `{"stocks":[{"ticker":"TWTR","name":"Twitter, Inc.","currency":"USD","current_price_cents":3833,`
    /// `"quantity":1,"current_price_timestamp":1597942580}]}`
    ///
    /// - Throws: DecodingError in case the data is invalid and may not be decoded.
    init(jsonData: Data) throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let decoded = try decoder.decode(StocksModel.self, from: jsonData)

        self = decoded
    }
}
