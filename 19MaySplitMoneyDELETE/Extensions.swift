import Foundation
import UIKit

extension UILabel {
    convenience init(text: String, fontName: String, size: CGFloat, tamic: Bool, color: UIColor ) {
        self.init(frame: .zero)
        self.text = text
        self.font =  UIFont(name: fontName, size: size)
        self.translatesAutoresizingMaskIntoConstraints = tamic
        self.textColor = color
    }

}

extension UIImageView {
    convenience init(name: String) {
        self.init(frame: .zero)
        self.image = UIImage(named: name)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


extension UITextField {
    convenience init(text: String, fontName: String, size: CGFloat, color: UIColor) {
        self.init(frame: .zero)
        self.text = text
        self.font = UIFont(name: fontName, size: size)
        self.textColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}


extension UIButton {
    convenience init(titel: String, titelColor: UIColor, cornerRadius: CGFloat, backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.setTitle(titel, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.setTitleColor(titelColor, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}


extension UIView {
    convenience init(color: UIColor, radius: CGFloat) {
        self.init(frame: .zero)
        self.backgroundColor = color
        self.layer.cornerRadius = radius
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
