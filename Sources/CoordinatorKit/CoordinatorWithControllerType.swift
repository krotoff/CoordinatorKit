//
//  CoordinatorWithControllerType.swift
//  
//
//  Created by Andrei Krotov on 11/05/2023.
//

import Foundation.NSUUID

import CoordinatableViewController

protocol CoordinatorWithControllerType: CoordinatorType {
    var controller: CoordinatableViewController { get }

    func makeController() -> CoordinatableViewController
}
