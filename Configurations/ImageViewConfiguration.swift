
import UIKit


public struct ImageViewConfiguration {
    public var contentMode: UIView.ContentMode
    public var backgroundColor: UIColor?
    public var tintColor: UIColor?
    
    public init(contentMode: UIView.ContentMode, backgroundColor: UIColor?, tintColor: UIColor?) {
        self.contentMode = contentMode
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
    }
}

public extension ImageViewConfiguration {
    
    static let aspectFitting = ImageViewConfiguration(contentMode: .scaleAspectFit, backgroundColor: nil, tintColor: nil)
    static let aspectFilling = ImageViewConfiguration(contentMode: .scaleAspectFill, backgroundColor: nil, tintColor: nil)
}

public extension UIImageView {
    public convenience init(configuration: ImageViewConfiguration) {
        self.init()
        apply(configuration: configuration)
    }
    
    public func apply(configuration: ImageViewConfiguration) {
        contentMode = configuration.contentMode
        backgroundColor = configuration.backgroundColor
        if let tint = configuration.tintColor {
            tintColor = tint
        }
    }
}
