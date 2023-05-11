//
//  RoutableCoordinator.swift
//  
//
//  Created by Andrei Krotov on 11/05/2023.
//

open class RoutableCoordinator<Route>: Coordinator {

    // MARK: - Public properties

    public var openRoute: ((Route) -> Void)?

    // MARK: - Open methods

    @discardableResult
    open func configureCallbacks(openRoute: @escaping ((Route) -> Void)) -> Coordinator {
        self.openRoute = openRoute

        return self
    }
}
