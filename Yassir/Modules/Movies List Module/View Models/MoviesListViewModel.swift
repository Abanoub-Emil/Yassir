//
//  MoviesListViewModel.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

protocol MoviesListViewModelProtocol {
    var movies: Observable<[Movie]> { get }
    var state: Observable<State> { get }
    var navigate: Observable<MoviesListNavigation> { get }
    func viewDidLoad()
    func didSelectMovie(index: Int)
}

final class MoviesListViewModel: MoviesListViewModelProtocol {
    
    let moviesListService: ServiceProtocol
    var navigate = Observable<MoviesListNavigation>(nil)
    var movies = Observable<[Movie]>([])
    var state = Observable<State>(State.populated)

    init(moviesListService: ServiceProtocol) {
        self.moviesListService = moviesListService
    }
    
    func viewDidLoad() {
        state.value = .loading
        moviesListService.makeRequest(T: Movies.self) { [weak self] result in
            switch result {
            case .success(let success):
                self?.movies.value = success.results ?? []
                self?.state.value = .populated
            case .failure(let failure):
                self?.state.value = .error(msg: failure.localizedDescription)
            }
        }
    }
    
    func didSelectMovie(index: Int) {
        if let movie = movies.value?[index] {
            navigate.value = .movieDetails(movie: movie)
        }
    }
}

#if DEBUG
extension MoviesListViewModel {
    func setTestMovie() {
        self.movies.value = [Movie.testMovie]
    }
}
#endif
