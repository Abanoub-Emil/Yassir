//
//  Coordinator.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 25/01/2023.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}

extension Coordinator {
    
    func add(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0 !== coordinator })
    }
}
