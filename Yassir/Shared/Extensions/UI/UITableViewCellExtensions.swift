//
//  UITableViewCellExtensions.swift
//  iOSTask
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit

extension UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
}
