//
//  dump.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation

public func rawDump<ValueT>(_ value: ValueT, debug: Bool = false) -> String {
    let value = value as Any
    let mirror = Mirror(reflecting: value)
    let children = mirror.children
    var str = ""
    let mark = "(\(type(of: value)))" + (children.count == 0 ? "\(value)" : "")
    str += mark
    if children.count > 0 {
        str += "\n"
        let childrenDump = children.map { child in
            var label = (child.label ?? "nil") + ": "
            label = debug ? "[l]" + label : label
            var value = rawDump(child.value, debug: debug)
            value = debug ? "[v]" + value : value
            return label + value
        }.joined(separator: "\n")
        str += indented(childrenDump)
    }
    return str
}

func indented(_ string: String, _ amount: Int = 1, _ indentString: String = "\t") -> String {
    let comps = string.components(separatedBy: "\n")
    return comps.map { String(repeating: indentString, count: amount) + $0 }.joined(separator: "\n")
}
