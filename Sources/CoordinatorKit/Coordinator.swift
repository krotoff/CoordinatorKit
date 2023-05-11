//
//  Coordinator.swift
//  
//
//  Created by Andrei Krotov on 11/05/2023.
//

import Foundation.NSUUID

import CoordinatableViewController

open class Coordinator: BaseCoordinator, CoordinatorWithControllerType {

    // MARK: - Public properties

    public var controller: CoordinatableViewController { privateController }

    // MARK: - Private properties

    private var privateController: CoordinatableViewController!
    private var childCoordinators = [UUID: CoordinatorType]()

    // MARK: - Init

    public init(parentCoordinator: BaseCoordinator) {
        super.init()

        privateController = makeController()
        privateController.onCompleted = { [unowned self, weak parentCoordinator] in parentCoordinator?.free(self) }
        parentCoordinator.store(coordinator: self)
    }

    // MARK: Parent Coodinator methods

    open func makeController() -> CoordinatableViewController {
        fatalError("#ERR: Method makeController() for \(Self.self) should be implemented")
    }
}
