// Generated using Sourcery 1.4.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation
import UIKit

extension AnimationConfig {
    public enum Defaults {
        public static let options: UIView.AnimationOptions = [
        .curveEaseInOut,
        .beginFromCurrentState,
        .allowUserInteraction,
    ]
        public static let duration: AnimationConfig.Duration = .medium
        public static let delay: DispatchTimeInterval = .seconds(0)
    }

    public static func make(
        options: UIView.AnimationOptions = Defaults.options,
        duration: AnimationConfig.Duration = Defaults.duration,
        delay: DispatchTimeInterval = Defaults.delay
    ) -> Self {
        .init(
            options: options,
            duration: duration,
            delay: delay
        )
    }
}
