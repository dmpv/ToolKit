//
//  types.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation

public protocol StateType: ValueType, Equatable {}

public protocol IDType: ValueType, Hashable {}
