
import UIKit

struct LabelConfiguration: Then {
    var font: UIFont
    var textColor: UIColor
    var numberOfLines: Int
    var textAlignment: NSTextAlignment
    var adjustsFontSizeToFitWidth: Bool
}

extension LabelConfiguration {
    
    static let base = LabelConfiguration(
        font: UIFont.systemFont(ofSize: 16, weight: .regular),
        textColor: .text,
        numberOfLines: 0,
        textAlignment: .left,
        adjustsFontSizeToFitWidth: false)
    
    static let light = base.with {
        $0.textColor = .white
    }
    
    
    static let barTitle = base.with {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        $0.textColor = .white
        $0.numberOfLines = 1
    }
    
    static let button = base.with {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
}


extension UILabel {
    
    func apply(configuration: LabelConfiguration) {
        textColor = configuration.textColor
        font = configuration.font
        numberOfLines = configuration.numberOfLines
        textAlignment = configuration.textAlignment
        adjustsFontSizeToFitWidth = configuration.adjustsFontSizeToFitWidth
    }
    
    convenience init(configuration: LabelConfiguration) {
        self.init()
        apply(configuration: configuration)
    }
}
