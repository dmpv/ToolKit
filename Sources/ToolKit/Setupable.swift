//
//  Setupable.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
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
