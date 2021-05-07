import Foundation

/// Separates the logic out of PortfolioViewController.
class PortfolioViewModel {
    enum Filter: Int {
        case myPortfolio, watchList, all
    }

    /// Delegate to be notified upon data events.
    weak var delegate: PortfolioViewModelDelegate?
    /// Filter to be applied on the stocks model.
    var filter: Filter = .myPortfolio {
        didSet {
            updateFilteredStocks()
        }
    }
    /// Holds a filtered, sorted stocks model for faster access.
    private(set) var filteredStocks = [StockModel]()

    private var portfolioModel: PortfolioModel?
    private var portfolioService: PortfolioService

    init(
        portfolioService: PortfolioService = .init()
    ) {
        self.portfolioService = portfolioService
    }

    /// Initiates the first fetch operation, called by the view when it's ready.
    func bootstrap() {
        fetchModel()
    }

    /// Fetches the model and notifies the delegate upon completion.
    func fetchModel() {
        delegate?.willLoadModel()

        portfolioService.fetch { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let portfolioModel):
                self.portfolioModel = portfolioModel

                self.updateFilteredStocks()

                DispatchQueue.main.async {
                    self.delegate?.didLoadModel()
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.delegate?.didEncounterError()
                }
            }
        }
    }

    private func updateFilteredStocks() {
        switch filter {
        case .myPortfolio:
            filteredStocks = portfolioModel?.stocks.filter(
                { stock in stock.quantity ?? 0 > 0 }
            ).sorted() ?? [StockModel]()
        case .watchList:
            filteredStocks = portfolioModel?.stocks.filter(
                { stock in stock.quantity ?? 0 == 0 }
            ).sorted() ?? [StockModel]()
        case .all:
            filteredStocks = portfolioModel?.stocks.sorted() ?? [StockModel]()
        }
    }
}
