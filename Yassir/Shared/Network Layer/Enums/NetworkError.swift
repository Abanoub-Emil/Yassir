//
//  NetworkError.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation

enum NetworkError: Error {
    case generalError
    case internalError
    case serverError
    case errorMsg(msg: String)
}

enum HTTPError: LocalizedError {
    case statusCode
}
