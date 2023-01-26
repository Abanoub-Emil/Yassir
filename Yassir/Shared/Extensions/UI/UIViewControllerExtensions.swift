//
//  UIViewControllerExtensions.swift
//  iOSTask
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import UIKit
import Toast

extension UIViewController {
    
    func makeActivityIndicator(size: CGSize) -> UIActivityIndicatorView {
        let style: UIActivityIndicatorView.Style = UIActivityIndicatorView.Style.medium
        let activityIndicator = UIActivityIndicatorView(style: style)
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        activityIndicator.frame = .init(origin: .zero, size: size)
        
        return activityIndicator
    }
    
    func handleErrors(error: NetworkError?) {
        DispatchQueue.main.async { [weak self] in
            if let error = error {
                switch error {
                case .serverError:
                    self?.showToast(message: "networkError".localized())
                default:
                    self?.showToast(message: "generalError".localized())
                }
            }
        }
    }
    
    func bindState(state: State) {
        switch state {
        case .loading:
            showLoading()
        case .populated:
            hideLoading()
        case .error(let msg):
            hideLoading()
            showMessageToUser(message: msg)
        }
    }
    
    func showMessageToUser(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.showToast(message: message)
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            ProgressDialog.alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.medium
            loadingIndicator.startAnimating();
            
            ProgressDialog.alert.view.addSubview(loadingIndicator)
            self.present(ProgressDialog.alert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                ProgressDialog.alert.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            ProgressDialog.alert.dismiss(animated: true, completion: nil)
        }
    }
    
    func showToast(message: String) {
        self.view.makeToast(message)
    }
}
