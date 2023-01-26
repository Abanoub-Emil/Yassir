//
//  MoviesListService.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

final class MoviesListService: ServiceProtocol {
    var baseURL: String {
        Environment.baseURL
    }
    
    var path: String {
        "discover/movie"
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
