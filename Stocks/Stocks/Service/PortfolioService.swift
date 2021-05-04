import Foundation

/// Concrete interface for accessing user's stocks portfolio REST API.
class PortfolioService {
    enum ServiceError: Error {
        case invalidData(Data?)
        case invalidUrl
        case requestError(Error?)
    }

    typealias Completion = (Result<PortfolioModel, Error>) -> Void

    var errorLogger: ErrorLogging = ErrorLogger.shared

    private let fetchUrl = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"

    /// Fetches user's stocks portfolio and invokes `completion` passing either a failure with an error or a
    /// list of stocks.
    func fetch(completion: @escaping Completion) {
        guard let url = URL(string: fetchUrl) else {
            completion(.failure(ServiceError.invalidUrl))
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            let statusCode = httpResponse?.statusCode ?? 0

            let succeeded = error == nil && data != nil && (200..<300).contains(statusCode)

            if !succeeded {
                if let httpResponse = httpResponse {
                    self?.errorLogger.logHTTP(error: error, request: request, response: httpResponse)
                } else if let error = error {
                    self?.errorLogger.logNonFatal(error: error)
                }

                completion(.failure(ServiceError.requestError(error)))
                return
            }

            do {
                let model = try PortfolioModel(jsonData: data ?? Data())
                completion(.success(model))
            } catch {
                completion(.failure(ServiceError.invalidData(data)))
            }
        }.resume()
    }
}
