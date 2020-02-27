//
//  MainCoordinator.swift
//  HackerNews
//
//  Created by Atiyeh, Brian (B.) on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    public func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    public func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    public func startChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators.removeAll()
        addChildCoordinator(childCoordinator)
        childCoordinator.start()
    }
}
