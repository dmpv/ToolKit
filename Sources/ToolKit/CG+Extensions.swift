//
//  CG+Extensions.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGRect: ValueType {}

extension CGRect {
    public var center: CGPoint {
        get {
            origin + CGPoint(size * 0.5)
        }
        set {
            origin = origin + newValue - center
        }
    }
}

extension CGPoint: ValueType {}

extension CGPoint {
    public static func + (lhs: Self, rhs: Self) -> Self {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    public static prefix func - (pt: Self) -> Self {
        .init(x: -pt.x, y: -pt.y)
    }

    public static func - (lhs: Self, rhs: Self) -> Self {
        lhs + -rhs
    }

    public init(_ size: CGSize) {
        self.init(x: size.width, y: size.height)
    }
}

extension CGSize: ValueType {}

extension CGSize {
    public static func * (size: Self, scaleFactor: CGFloat) -> Self {
        .init(width: size.width * scaleFactor, height: size.height * scaleFactor)
    }
}
