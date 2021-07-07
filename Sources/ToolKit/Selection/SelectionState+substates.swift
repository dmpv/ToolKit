//
//  SelectionState+substates.swift
//  ContestKit
//
//  Created by Dmitry Purtov on 31.01.2021.
//

import Foundation

extension SelectionState {
    public var selectedIndex: Int {
        get { values.firstIndex(of: selectedValue)! }
        set { selectedValue = values[newValue] }
    }
}
