
import UIKit


struct ImageViewConfiguration: Then {
    var contentMode: UIView.ContentMode
    var backgroundColor: UIColor?
    var tintColor: UIColor?
}

extension ImageViewConfiguration {
    
    static let aspectFitting = ImageViewConfiguration(contentMode: .scaleAspectFit, backgroundColor: nil, tintColor: nil)
    static let aspectFilling = ImageViewConfiguration(contentMode: .scaleAspectFill, backgroundColor: nil, tintColor: nil)
}

extension UIImageView {
    convenience init(configuration: ImageViewConfiguration) {
        self.init()
        apply(configuration: configuration)
    }
    
    func apply(configuration: ImageViewConfiguration) {
        contentMode = configuration.contentMode
        backgroundColor = configuration.backgroundColor
        if let tint = configuration.tintColor {
            tintColor = tint
        }
    }
}
