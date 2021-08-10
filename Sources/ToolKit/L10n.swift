//
//  L10n.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation

public class L10n: Namespace {
    public static func stub(_ string: String) -> String {
        NSLocalizedString(string, comment: "")
    }
}
