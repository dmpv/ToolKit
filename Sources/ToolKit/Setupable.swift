//
//  Setupable.swift
//  
//
//  Created by Dmitry Purtov on 08.07.2021.
//

import Foundation

public typealias Setuper<ObjectT> = (ObjectT) -> Void

public protocol Setupable {}

public extension Setupable {
    @discardableResult
    func applying(_ setuper: Setuper<Self>) -> Self {
        setuper(self)
        return self
    }
}

extension NSObject: Setupable {}
