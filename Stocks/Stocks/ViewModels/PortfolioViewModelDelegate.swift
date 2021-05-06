import Foundation

/// To be implemented by the ViewModel delegate.
protocol PortfolioViewModelDelegate: AnyObject {
    /// Invoked when a fetch operation resulted in error.
    func didEncounterError()
    /// Invoked when a fetch operation was successfully.
    func didLoadModel()
    /// Invoked before a fetch operation has started. 
    func willLoadModel()
}
