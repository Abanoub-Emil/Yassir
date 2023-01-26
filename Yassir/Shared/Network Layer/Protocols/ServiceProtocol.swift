//
//  ServiceProtocol.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

typealias Headers = [String: String]
typealias Parameters = [String: Any]

protocol ServiceProtocol {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: Headers? { get }
    var parameters: Parameters? { get }
    var parametersEncoding: ParametersEncoding? { get }
}

extension ServiceProtocol {
    private func getUrlRequest() -> URLRequest? {
        var urlComponents = URLComponents(string: baseURL + path)
        if parametersEncoding == .url {
            urlComponents?.queryItems = getQueryItems()
        }
        if let url = urlComponents?.url {
            var urlRquest = URLRequest(url: url)
            
            urlRquest.httpMethod = httpMethod.rawValue
            headers?.forEach { key, value in
                urlRquest.addValue(value, forHTTPHeaderField: key)
            }
            if let params = parameters, parametersEncoding == .json {
                urlRquest.httpBody = try? JSONSerialization.data(withJSONObject: params)
            }
            return urlRquest
        }
        return nil
    }
    
    private func getQueryItems() -> [URLQueryItem] {
        if let parameters {
            var queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            return queryItems
        }
        return []
    }
    
    func makeRequest<T: Codable>(T: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        if let urlRequest = getUrlRequest() {
            NetworkManager.shared.request(urlRequest: urlRequest, T: T, completion: completion)
        } else {
            completion(.failure(.internalError))
        }
    }
}
