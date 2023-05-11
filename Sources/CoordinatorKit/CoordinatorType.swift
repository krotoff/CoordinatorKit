//
//  CoordinatorType.swift
//  
//
//  Created by Andrei Krotov on 11/05/2023.
//

import Foundation.NSUUID

protocol CoordinatorType {
    var identifier: UUID { get }
}

extension CoordinatorType {
    func stop(animated: Bool = true, completion: (() -> Void)? = nil) {}
}
