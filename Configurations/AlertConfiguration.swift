
import UIKit

public struct AlertConfiguration {
    public enum Style {
        case title(String)
        case message(String)
        case full(title: String, message: String)
    }
    public let style: Style
    public let actions: [UIAlertAction]
    public let preferredAction: UIAlertAction?
    
    public init(style: Style, actions: [UIAlertAction], preferredAction: UIAlertAction?) {
        self.style = style
        self.actions = actions
        self.preferredAction = preferredAction
    }
}

public extension AlertConfiguration.Style {
    
    public var title: String? {
        switch self {
        case .full(let title, _), .title(let title):
            return title
        default:
            return nil
        }
    }
    
    public var message: String? {
        switch self {
        case .full(_, let message), .message(let message):
            return message
        default:
            return nil
        }
    }
}

public extension UIAlertController {
    public convenience init(_ configuration: AlertConfiguration) {
        self.init(title: configuration.style.title, message: configuration.style.message, preferredStyle: .alert)
        for action in configuration.actions { addAction(action) }
        preferredAction = configuration.preferredAction
    }
}

