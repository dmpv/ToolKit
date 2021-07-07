//
//  SelectionState.swift
//  ContestKit
//
//  Created by Dmitry Purtov on 30.01.2021.
//

import Foundation

public struct SelectionState<ValueT: Equatable>: Equatable {
    public var values: [ValueT] { didSet { validate() } }
    public var selectedValue: ValueT { didSet { validate() } }

    public init(values: [ValueT], selectedValue: ValueT) {
        self.values = values
        self.selectedValue = selectedValue
        validate()
    }

    private func validate() {
        assert(values != [])
        assert(values.areUnique)
        assert(values.contains(selectedValue))
    }
}

extension SelectionState: Hashable where ValueT: Hashable {}
