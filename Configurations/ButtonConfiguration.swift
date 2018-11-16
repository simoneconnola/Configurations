
import UIKit

struct ButtonConfiguration: Then {

    struct Stateful {
        var titleColor: UIColor?
        var image: UIImage?
        var backgroundImage: UIImage?
    }
    
    var type: UIButton.ButtonType
    var contentEdgeInsets: UIEdgeInsets
    var backgroundColor: UIColor
    var label: LabelConfiguration?
    var layer: LayerConfiguration?
    var stateful: [(state: UIControl.State, configuration: Stateful)]
    
}

extension ButtonConfiguration {
    
    static let base = ButtonConfiguration(type: .system, contentEdgeInsets: .zero, backgroundColor: .clear, label: nil, layer: nil, stateful: [])
    
    static let dark = base.with {
        $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        $0.backgroundColor = .button
        $0.label = .button
        $0.layer = .button
        
        let normalState = Stateful(titleColor: .white, image: nil, backgroundImage: nil)
        let disabledState = Stateful(titleColor: .disabledText, image: nil, backgroundImage: nil)
        $0.stateful = [(.normal, normalState), (.disabled, disabledState)]
    }
}

extension UIButton {
    
    convenience init(configuration: ButtonConfiguration) {
        self.init(type: configuration.type)
        apply(configuration: configuration)
    }
    
    func apply(configuration: ButtonConfiguration) {
        
        backgroundColor = configuration.backgroundColor
        contentEdgeInsets = configuration.contentEdgeInsets
        
        if let labelConfiguration = configuration.label {
            titleLabel?.apply(configuration: labelConfiguration)
        }
        
        if let layerConfiguration = configuration.layer {
            layer.apply(configuration: layerConfiguration)
        }
        
        for (state, config) in configuration.stateful {
            setTitleColor(config.titleColor, for: state)
            setImage(config.image, for: state)
            setBackgroundImage(config.backgroundImage, for: state)
        }
    }
}

