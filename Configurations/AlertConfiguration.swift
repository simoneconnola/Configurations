
import UIKit

struct AlertConfiguration {
    enum Style {
        case title(String)
        case message(String)
        case full(title: String, message: String)
    }
    let style: Style
    let actions: [UIAlertAction]
    let preferredAction: UIAlertAction?
}

extension AlertConfiguration {
    
    static func error(title: String = "error".localized(), message: String, actions: [UIAlertAction] = [.ok], preferredAction: UIAlertAction? = nil) -> AlertConfiguration {
        return AlertConfiguration(style: .full(title: title, message: message), actions: actions, preferredAction: preferredAction)
    }
}

extension UIAlertAction {
    static var cancel: UIAlertAction { return UIAlertAction(title: "cancel".localized(), style: .cancel) }
    static var ok: UIAlertAction { return UIAlertAction(title: "ok".localized(), style: .default) }
}

extension AlertConfiguration.Style {
    
    var title: String? {
        switch self {
        case .full(let title, _), .title(let title):
            return title
        default:
            return nil
        }
    }
    
    var message: String? {
        switch self {
        case .full(_, let message), .message(let message):
            return message
        default:
            return nil
        }
    }
}

extension UIAlertController {
    convenience init(_ alert: AlertConfiguration) {
        self.init(title: alert.style.title, message: alert.style.message, preferredStyle: .alert)
        for action in alert.actions { addAction(action) }
        preferredAction = alert.preferredAction
    }
}

