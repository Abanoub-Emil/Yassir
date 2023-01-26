//
//  SceneDelegate.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 25/01/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var applicationCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupApplicationCoordinator(windowScene: windowScene)
        setupIntialView()
    }
    
    func setupApplicationCoordinator(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        applicationCoordinator = AppCoordinator(window: window)
    }
    
    // Setup entry screen
    func setupIntialView() {
        applicationCoordinator?.start()
    }

}

