
import UIKit

public struct ButtonConfiguration {

    public struct StateConfiguration {
        var titleColor: UIColor?
        var image: UIImage?
        var backgroundImage: UIImage?
    }
    
    public var type: UIButton.ButtonType
    public var contentEdgeInsets: UIEdgeInsets
    public var backgroundColor: UIColor
    public var labelConfiguration: LabelConfiguration?
    public var layerConfiguration: LayerConfiguration?
    public var stateConfigurations: [(state: UIControl.State, configuration: StateConfiguration)]
    
    public init(type: UIButton.ButtonType,
                contentEdgeInsets: UIEdgeInsets,
                backgroundColor: UIColor,
                labelConfiguration: LabelConfiguration?,
                layerConfiguration: LayerConfiguration?,
                stateConfigurations: [(state: UIControl.State, configuration: StateConfiguration)]){
        self.type = type
        self.contentEdgeInsets = contentEdgeInsets
        self.backgroundColor = backgroundColor
        self.labelConfiguration = labelConfiguration
        self.layerConfiguration = layerConfiguration
        self.stateConfigurations = stateConfigurations
    }
}

public extension UIButton {
    
    public convenience init(configuration: ButtonConfiguration) {
        self.init(type: configuration.type)
        apply(configuration: configuration)
    }
    
    public func apply(configuration: ButtonConfiguration) {
        
        backgroundColor = configuration.backgroundColor
        contentEdgeInsets = configuration.contentEdgeInsets
        
        if let labelConfiguration = configuration.labelConfiguration {
            titleLabel?.apply(configuration: labelConfiguration)
        }
        
        if let layerConfiguration = configuration.layerConfiguration {
            layer.apply(configuration: layerConfiguration)
        }
        
        for (state, configuration) in configuration.stateConfigurations {
            setTitleColor(configuration.titleColor, for: state)
            setImage(configuration.image, for: state)
            setBackgroundImage(configuration.backgroundImage, for: state)
        }
    }
}

