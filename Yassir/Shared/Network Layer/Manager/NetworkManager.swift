//
//  NetworkManager.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func request<T>(urlRequest: URLRequest, T: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Codable
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    private var cancellable: AnyCancellable?

    private init() { }
    
    func request<T>(urlRequest: URLRequest, T: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Codable {
        print(urlRequest.url?.absoluteString ?? "")
        cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    print(output.response)
                    completion(.failure(NetworkError.serverError))
                    throw HTTPError.statusCode
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    completion(.failure(NetworkError.errorMsg(msg: error.localizedDescription)))
                case .finished:
                    print("Received completion: \($0)")
                }
            },
                  receiveValue: { object in
                completion(.success(object))
            })
    }
}
