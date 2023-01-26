//
//  Routing.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 25/01/2023.
//

import UIKit

typealias NavigationBackClosure = (() -> Void)

protocol Routing: AnyObject {
    func push(_ vc: UIViewController, isAnimated: Bool, onNavigateBack: NavigationBackClosure?)
    func pop(_ isAnimated: Bool)
    func pushToRoot(_ vc: UIViewController, isAnimated: Bool, onNavigateBack closure: NavigationBackClosure?)
    func popToRoot(_ isAnimated: Bool)
    func present(_ vc: UIViewController, isAnimated: Bool, onDismiss: NavigationBackClosure?)
    func dismissModule(animated: Bool)
    func controlPopGesture(enable: Bool)
}

