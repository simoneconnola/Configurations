
import UIKit

public struct LabelConfiguration {
    public var font: UIFont
    public var textColor: UIColor
    public var numberOfLines: Int
    public var textAlignment: NSTextAlignment
    public var adjustsFontSizeToFitWidth: Bool
    
    public init(font: UIFont, textColor: UIColor, numberOfLines: Int, textAlignment: NSTextAlignment, adjustsFontSizeToFitWidth: Bool) {
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
    }
}

public extension UILabel {
    
    public func apply(configuration: LabelConfiguration) {
        textColor = configuration.textColor
        font = configuration.font
        numberOfLines = configuration.numberOfLines
        textAlignment = configuration.textAlignment
        adjustsFontSizeToFitWidth = configuration.adjustsFontSizeToFitWidth
    }
    
    public convenience init(configuration: LabelConfiguration) {
        self.init()
        apply(configuration: configuration)
    }
}
