//
//  ValueType.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation

public protocol ValueType {
    typealias Reducer = (Self) -> Self
    typealias Adjuster = (inout Self) -> Void
}

extension ValueType {
    public func reduce(with adjuster: Adjuster) -> Self {
        var value = self
        adjuster(&value)
        return value
    }

    public mutating func adjust(with adjuster: Adjuster) {
        adjuster(&self)
    }
}
