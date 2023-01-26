//
//  MovieDetailsService.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

final class MoviesDetailsService: ServiceProtocol {
    
    let movieID: Int
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    var baseURL: String {
        Environment.baseURL
    }
    
    var path: String {
        "/movie/\(movieID)"
    }
    
    var httpMethod: HTTPMethod {
        .GET
    }
    
    var headers: Headers? = [:]
    
    var parameters: Parameters? = [
        "api_key":  Environment.apiKey,
        "language": "en-US"
    ]
    
    var parametersEncoding: ParametersEncoding? = .url
    
}
