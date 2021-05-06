import Foundation
import UIKit

/// Presents relevant information held by a `StockModel`.
class StockCell: UITableViewCell {
    @IBOutlet private var tickerLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var quantityLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!

    /// Configure the cell with the given `StockModel`.
    func configure(with stockModel: StockModel, formatter: ExtendedFormatter) {
        tickerLabel.text = stockModel.ticker
        nameLabel.text = stockModel.name
        quantityLabel.text = nil
        if let quantity = stockModel.quantity {
            quantityLabel.text = String(quantity)
        }
        priceLabel.text = stockModel.formattedCurrentPrice
    }
}
