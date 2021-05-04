import UIKit

/// Helper class for implementing useful functionalities.
@IBDesignable
class ExtendedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}
