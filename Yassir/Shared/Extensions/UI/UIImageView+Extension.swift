//
//  UIImageView+Extension.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImageFrom(url: String, completion: ((UIImage?) -> Void)? = nil) {
        let url = Environment.imagesURL + url
        if url.isEmpty {
            self.image = #imageLiteral(resourceName: "logo")
            return
        }
        let encodedUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        self.kf.indicatorType = .activity
        self.kf.setImage(with: encodedUrl, placeholder: #imageLiteral(resourceName: "logo"), options: nil, progressBlock: nil)
    }
    
}
