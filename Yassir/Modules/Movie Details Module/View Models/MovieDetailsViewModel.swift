//
//  MovieDetailsViewModel.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

protocol MovieDetailsViewModelProtocol {
    var movieDetails: Observable<MovieDetails> { get }
    var state: Observable<State> { get }
    func viewDidLoad()
}

final class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    
    let movieDetailsService: ServiceProtocol
    var movieDetails = Observable<MovieDetails>(nil)
    var state = Observable<State>(State.populated)

    init(movieDetailsService: ServiceProtocol) {
        self.movieDetailsService = movieDetailsService
    }
    
    func viewDidLoad() {
        movieDetailsService.makeRequest(T: MovieDetails.self) { [weak self] result in
            switch result {
            case .success(let movieDetails):
                self?.movieDetails.value = movieDetails
            case .failure(let failure):
                self?.state.value = .error(msg: failure.localizedDescription)
            }
        }
    }
}
