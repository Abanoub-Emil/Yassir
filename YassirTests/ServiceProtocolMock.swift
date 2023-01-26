//
//  ServiceProtocolMock.swift
//  YassirTests
//
//  Created by Abanoub Ghaly on 26/01/2023.
//

import Foundation
@testable import Yassir

class ServiceProtocolMock: ServiceProtocol {
    var baseURL: String {
        "mock_baseURL"
    }
    
    var path: String {
        "mock_path"
    }
    
    var httpMethod: Yassir.HTTPMethod {
        .GET
    }
    
    var headers: Yassir.Headers? = [:]
    
    var parameters: Yassir.Parameters? = [:]
    
    var parametersEncoding: Yassir.ParametersEncoding? = nil
    
    
}
