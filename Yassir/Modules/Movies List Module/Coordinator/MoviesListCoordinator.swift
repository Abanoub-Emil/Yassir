//
//  MoviesListCoordinator.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 25/01/2023.
//

import UIKit

final class MoviesListCoordinator: BaseCoordinator {
    private let router: Routing
    
    init(router: Routing) {
        self.router = router
    }
    
    override func start() {
        let viewController = MoviesListViewController()
        let viewModel = MoviesListViewModel(moviesListService: MoviesListService())
        viewController.viewModel = viewModel
        observeNavigation(viewModel: viewModel)
        router.push(viewController, isAnimated: true, onNavigateBack: isCompleted)
    }
    
    private func observeNavigation(viewModel: MoviesListViewModel) {
        viewModel.navigate.bind({ [weak self] destination in
            guard let self = self, case let .movieDetails(movie) = destination else { return }
            self.showMovieDetails(movieID: movie.id ?? 0)
        })
    }
    
    private func showMovieDetails(movieID: Int) {
        let coordinator = MovieDetailsCoordinator(router: self.router, movieID: movieID)

        self.add(coordinator: coordinator)
        
        coordinator.isCompleted = { [weak self] in
            self?.remove(coordinator: coordinator)
        }
        
        coordinator.start()
    }
}

enum MoviesListNavigation {
    case movieDetails(movie: Movie)
}
