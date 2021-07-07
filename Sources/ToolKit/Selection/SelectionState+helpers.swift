//
//  SelectionState+helpers.swift
//  ContestKit
//
//  Created by Dmitry Purtov on 31.01.2021.
//

import Foundation

extension SelectionState {
    public init(values: [ValueT], selectedIndex: Int = 0) {
        self.init(values: values, selectedValue: values[selectedIndex])
    }

    public mutating func selectLast() {
        selectedValue = values.last!
    }

    public mutating func updateShiftingLeft(with values: [ValueT]) {
        self = .init(
            values: values,
            selectedValue: {
                let prefix = self.values[0...selectedIndex]
                return prefix.last(where: { values.contains($0) }) ?? values.first!
            }()
        )
    }

    public mutating func updateSavingIndex(with values: [ValueT]) {
        self = .init(values: values, selectedIndex: selectedIndex)
    }

    public func map<ToValueT>(_ transform: (ValueT) -> ToValueT) -> SelectionState<ToValueT> {
        .init(
            values: values.map(transform),
            selectedIndex: selectedIndex
        )
    }
}
