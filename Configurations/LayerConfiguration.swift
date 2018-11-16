
import UIKit

struct LayerConfiguration: Then {
    
    struct Shadow {
        var color: UIColor
        var opacity: Float
        var offset: UIOffset
        var radius: CGFloat
    }
    
    var cornerRadius: CGFloat
    var shadow: Shadow?
}

extension LayerConfiguration {
    
    static let base = LayerConfiguration(cornerRadius: 0, shadow: nil)
    
    static let button = base.with {
        $0.cornerRadius = 3
        $0.shadow = Shadow(color: .black, opacity: 0.22, offset: UIOffset(horizontal: 0, vertical: 2), radius: 2)
    }
}

extension CALayer {
    
    convenience init(configuration: LayerConfiguration) {
        self.init()
        apply(configuration: configuration)
    }
    
    func apply(configuration: LayerConfiguration) {
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
