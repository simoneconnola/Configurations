
import UIKit

public struct LayerConfiguration {
    
    public struct Shadow {
        var color: UIColor
        var opacity: Float
        var offset: UIOffset
        var radius: CGFloat
    }
    
    public var cornerRadius: CGFloat
    public var shadow: Shadow?
    
    public init(cornerRadius: CGFloat, shadow: Shadow) {
        self.cornerRadius = cornerRadius
        self.shadow = shadow
    }
}

public extension CALayer {
    
    public convenience init(configuration: LayerConfiguration) {
        self.init()
        apply(configuration: configuration)
    }
    
    public func apply(configuration: LayerConfiguration) {
        cornerRadius = configuration.cornerRadius
        if let shadow = configuration.shadow {
            shadowColor = shadow.color.cgColor
            shadowOpacity = shadow.opacity
            shadowOffset = CGSize(width: shadow.offset.horizontal, height: shadow.offset.vertical)
            shadowRadius = shadow.radius
            masksToBounds = false
        }
    }
}
