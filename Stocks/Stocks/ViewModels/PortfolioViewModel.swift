import Foundation

/// Separates the logic out of PortfolioViewController.
class PortfolioViewModel {
    enum Filter: Int {
        case myPortfolio, watchList, all
    }

    weak var delegate: PortfolioViewModelDelegate?
    var filter: Filter = .myPortfolio {
        didSet {
            updateFilteredStocks()
        }
    }
    var filteredStocks = [StockModel]()

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
            DispatchQueue.main.async {
                guard let self = self else { return }

                switch result {
                case .success(let portfolioModel):
                    self.portfolioModel = portfolioModel

                    self.updateFilteredStocks()

                    self.delegate?.didLoadModel()
                case .failure(_):
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
