//
//  BaseCoordinator.swift
//  
//
//  Created by Andrei Krotov on 11/05/2023.
//

import Foundation.NSUUID

open class BaseCoordinator: CoordinatorType {

    // MARK: - Public properties

    public let identifier = UUID()

    // MARK: - Private properties

    private var childCoordinators = [UUID: CoordinatorType]()

    // MARK: - Init

    public init() {}

    // MARK: CoordinatorType methods

    func store(coordinator: CoordinatorType) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    func free(_ coordinator: CoordinatorType, animated: Bool = true, completion: (() -> Void)? = nil) {
        coordinator.stop(animated: animated, completion: completion)
        childCoordinators.removeValue(forKey: coordinator.identifier)
    }

    public func freeAllChildren(animated: Bool = true) {
        childCoordinators.values.forEach { [weak self] coordinator in
            self?.free(coordinator, animated: animated)
        }
    }
}

