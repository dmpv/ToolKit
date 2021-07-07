//
//  File.swift
//  
//
//  Created by Dmitry Purtov on 07.07.2021.
//

import Foundation

public class L10n: Namespace {
    public static func stub(_ string: String) -> String {
        NSLocalizedString(string, comment: "")
    }
}
