//
//  misc.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation

public func schedule(interval: DispatchTimeInterval = .seconds(1), times: Int = 5, execute: @escaping () -> Void) {
    guard times > 0 else { return }
    execute()
    DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
        schedule(interval: interval, times: times - 1, execute: execute)
    }
}

public func scheduleEnumerated(interval: DispatchTimeInterval = .seconds(1), times: Int = 5, execute: @escaping (Int) -> Void) {
    var iteration = 0
    schedule(interval: interval, times: times) {
        execute(iteration)
        iteration += 1
    }
}

extension DispatchTimeInterval {
    public var seconds: TimeInterval {
        switch self {
        case .seconds(let seconds):
            return .init(seconds)
        case .milliseconds(let milliseconds):
            return .init(milliseconds) / 1000
        case .microseconds(let microseconds):
            return .init(microseconds) / 1000_000
        case .nanoseconds(let nanoseconds):
            return .init(nanoseconds) / 1000_000_000
        case .never:
            return .infinity
        default:
            fatalError(.notImplementedYet)
        }
    }
}
