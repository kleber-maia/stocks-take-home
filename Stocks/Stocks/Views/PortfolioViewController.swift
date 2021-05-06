import UIKit

/// Presents the user's stocks portfolio.
class PortfolioViewController: UIViewController {
    private let formatter = ExtendedFormatter()
    private var viewModel = PortfolioViewModel()

    @IBOutlet private var segmentedControl: ExtendedSegmentedControl!
    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "portfolio_title".localized

        NSLayoutConstraint.activate(
            [segmentedControl.heightAnchor.constraint(equalToConstant: 32)]
        )
        navigationItem.titleView = segmentedControl

        tableView.contentInset.top = 24

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    override func viewDidAppear(_ animated: Bool) {
        viewModel.delegate = self
        viewModel.bootstrap()
    }

    @objc func pullToRefresh(_ sender: Any) {
        viewModel.fetchModel()
    }

    func toggleRefreshing(_ refreshing: Bool) {
        segmentedControl.isEnabled = !refreshing

        if !refreshing {
            tableView.refreshControl?.endRefreshing()
        }
    }

    @IBAction func segmentedControlChanged(_ sender: Any) {
        guard let filter = PortfolioViewModel.Filter(rawValue: segmentedControl.selectedSegmentIndex) else { return }

        viewModel.filter = filter

        tableView.reloadData()
    }
}

// PortfolioViewModelDelegate

extension PortfolioViewController: PortfolioViewModelDelegate {
    func didEncounterError() {
        let alert = UIAlertController(
            title: "portfolio_error_title".localized,
            message: "portfolio_error_message".localized,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "general_cancel".localized, style: .cancel))
        alert.addAction(UIAlertAction(title: "general_retry".localized, style: .default, handler: { [weak self] _ in
            self?.viewModel.fetchModel()
        }))

        present(alert, animated: true) { [weak self] in
            self?.toggleRefreshing(false)
        }
    }

    func didLoadModel() {
        _ = view.subviews.map { $0.isUserInteractionEnabled = true }

        tableView.reloadData()

        toggleRefreshing(false)
    }

    func willLoadModel() {
        toggleRefreshing(true)
    }
}

// UITableViewDataSource

extension PortfolioViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredStocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // avoid an index out of bounds exception
        guard viewModel.filteredStocks.count > indexPath.row else {
            return tableView.dequeueReusableCell(withIdentifier: "InvalidDataCell", for: indexPath)
        }

        // avoid a runtime exception when the correct cell is not found
        guard let stockCell = tableView.dequeueReusableCell(withIdentifier: "StockCell", for: indexPath) as? StockCell else {
            return tableView.dequeueReusableCell(withIdentifier: "CellNotFoundCell", for: indexPath)
        }

        let stockModel = viewModel.filteredStocks[indexPath.row]
        stockCell.configure(with: stockModel, formatter: formatter)

        return stockCell
    }
}
