import Foundation


extension String {
    /// Returns the localized version of the String.
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
