//
//  ProgressDialog.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit

struct ProgressDialog {
    static var alert = UIAlertController()
    static var progressView = UIProgressView()
    static var progressPoint: Float = 0{
        didSet{
            if(progressPoint == 1) {
                ProgressDialog.alert.dismiss(animated: true, completion: nil)
            }
        }
    }
}
