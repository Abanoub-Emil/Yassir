//
//  MovieDetailsCoordinator.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

final class MovieDetailsCoordinator: BaseCoordinator {
    private let router: Routing
    private let movieID: Int
    
    init(router: Routing, movieID: Int) {
        self.router = router
        self.movieID = movieID
    }
    
    override func start() {
        let viewController = MovieDetailsViewController()
        let viewModel = MovieDetailsViewModel(movieDetailsService: MoviesDetailsService(movieID: movieID))
        viewController.viewModel = viewModel
        router.push(viewController, isAnimated: true, onNavigateBack: isCompleted)
    }
}
