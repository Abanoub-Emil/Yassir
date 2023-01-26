//
//  AppCoordinator.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 25/01/2023.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
        
    private let window: UIWindow
    private var router: Routing?
    private var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()

    init(window: UIWindow) {
        self.window = window
        self.router = Router(navigationController: navigationController)
    }
    
    override func start() {
        navigateToMoviesListVC()
    }

    func navigateToMoviesListVC() {
        if let router {
            let moviesListCoordinator = MoviesListCoordinator(router: router)
            self.add(coordinator: moviesListCoordinator)
            
            moviesListCoordinator.isCompleted = { [weak self] in
                    self?.remove(coordinator: moviesListCoordinator)
            }
            
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            
            moviesListCoordinator.start()
        }
    }
}

