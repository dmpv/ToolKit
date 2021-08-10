//
//  SelectionState+substates.swift
//  ToolKit
//
//  Created by Dmitry Purtov on 19.04.2020.
//  Copyright © 2020 djpurtov. All rights reserved.
//

import Foundation

extension SelectionState {
    public var selectedIndex: Int {
        get { values.firstIndex(of: selectedValue)! }
        set { selectedValue = values[newValue] }
    }
}
