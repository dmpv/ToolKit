//
//  Benchmark.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation

public class Benchmark {
    public static var benchmarker: ((Int, (() -> Void)?) -> UInt64)!
}

extension Benchmark {
    public static func benchmark(
        _ description: String? = nil,
        context: String = #function,
        iterationCount: Int = 1000,
        log: (String) -> Void = { print($0) },
        execute: @escaping () -> Void
    ) {
        let messagePrefix: String = {
            let description = description.map { "::" + $0 } ?? ""
            return "\(context)" + description
        }()
        log(messagePrefix + " in progress...")
        let measuredTime = Self.benchmarker(iterationCount, execute)
        log(messagePrefix + " finished in \(measuredTime) ns")
    }
}
