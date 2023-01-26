//
//  UIViewExtensions.swift
//  iOSTask
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit

extension UIView {
    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIView {
    // MARK: - Reusable View
    func loadViewFromNib() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
