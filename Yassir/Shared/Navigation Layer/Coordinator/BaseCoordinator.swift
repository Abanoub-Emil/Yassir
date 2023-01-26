//
//  BaseCoordinator.swift
//  Yassir
//
//  Created by Abanoub Ghaly on 25/01/2023.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var isCompleted : (() -> Void)? // Closure to be executed when vc deallocated from memory
    
    func start() {
        fatalError("start() method must be implemented")
    }
}


