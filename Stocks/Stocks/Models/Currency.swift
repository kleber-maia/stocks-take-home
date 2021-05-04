import Foundation

/// Represents the supported currency for stocks price.
enum Currency: String, Codable {
    case BRL
    case USD

    var decimalSeparator: String {
        switch self {
        case .BRL:
            return ","
        case .USD:
            return "."
        }
    }
    var groupingSeparator: String {
        switch self {
        case .BRL:
            return "."
        case .USD:
            return ","
        }
    }
    var symbol: String {
        switch self {
        case .BRL:
            return "R$"
        case .USD:
            return "US$"
        }
    }
}
