//
//  UI+Extensions.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation
import UIKit

import GenKit

extension UIEdgeInsets: ValueType {}

extension UIEdgeInsets {
    public init(uniform inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }

    public static prefix func - (insets: Self) -> Self {
        .init(top: -insets.top, left: -insets.left, bottom: -insets.bottom, right: -insets.right)
    }
}

public func perform(animated: Bool, execute: @escaping () -> Void) {
    perform(with: animated ? AnimationConfig() : nil, execute: execute)
}

public func perform(with animationConfig: AnimationConfig?, execute: @escaping () -> Void) {
    if let animationConfig = animationConfig {
        UIView.animate(with: animationConfig) { execute() }
    } else {
        UIView.performWithoutAnimation {
            execute()
        }
    }
}

public struct AnimationConfig: AutoMakeable {
    var options: UIView.AnimationOptions = [
        .curveEaseInOut,
        .beginFromCurrentState,
        .allowUserInteraction,
    ]
    var duration: Duration = .medium
    var delay: DispatchTimeInterval = .seconds(0)
}

extension AnimationConfig {
    public enum Duration: TimeInterval {
        case short = 0.2
        case medium = 0.4
        case long = 0.6
    }
}

extension UIView {
    static func animate(with config: AnimationConfig, animations: @escaping () -> Void) {
        animate(
            withDuration: config.duration.rawValue,
            delay: config.delay.seconds,
            options: config.options,
            animations: animations,
            completion: nil
        )
    }

    public static func animate(with animations: @escaping () -> Void) {
        animate(with: AnimationConfig(), animations: animations)
    }
}

public let noAutoresize: Setuper<UIView> = {
    $0.translatesAutoresizingMaskIntoConstraints = false
}
