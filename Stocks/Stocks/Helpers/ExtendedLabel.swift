import UIKit

/// Helper class for implementing useful functionalities.
@IBDesignable
class ExtendedLabel: UILabel {
    @IBInspectable
    var localizable = true

    override var text: String? {
        didSet {
            guard localizable else { return }

            if let text = text, text != text.localized {
                self.text = text.localized
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        // force localization
        text = text
    }
}
