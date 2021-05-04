import UIKit

/// Helper class for implementing useful functionalities.
@IBDesignable
class ExtendedSegmentedControl: UISegmentedControl {
    /// Enforces the visual changes according to our properties.
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = .clear

        clipsToBounds = true
        layer.cornerRadius = bounds.height / 2

        if let foregroundImageView = subviews[numberOfSegments] as? UIImageView {
            foregroundImageView.image = UIImage()
            foregroundImageView.clipsToBounds = true
            foregroundImageView.backgroundColor = selectedSegmentTintColor
            foregroundImageView.layer.cornerRadius = (bounds.height / 2) + 4
        }

        for i in 0..<numberOfSegments {
            setTitle(titleForSegment(at: i)?.localized, forSegmentAt: i)
        }
    }
}
