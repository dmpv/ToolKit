//
//  File.swift
//  
//
//  Created by Dmitry Purtov on 07.07.2021.
//

import Foundation

extension Array where Element: Identifiable {
    public subscript(safe id: Element.ID) -> Element? {
        get {
            let elements = filter { $0.id == id }
            assert(elements.count <= 1)
            return elements.first
        }
        set {
            guard let newValue = newValue else {
                removeAll(where: { $0.id == id })
                return
            }
            guard newValue.id == id else {
                fatalError(.shouldNeverBeCalled("Can't set \(type(of: newValue)) with id \(newValue.id) for id \(id)"))
            }
            if let index = firstIndex(where: { $0.id == id }) {
                self[index] = newValue
            } else {
                append(newValue)
            }
        }
    }

    public subscript(id: Element.ID) -> Element {
        get {
            self[safe: id]!
        }
        set {
            self[safe: id] = newValue
        }
    }
}

extension Array where Element: Equatable {
    public var areUnique: Bool {
        unique.count == count
    }

    public var unique: Self {
        reduce([]) { partialUnique, element in
            partialUnique.contains(element) ? partialUnique : partialUnique + [element]
        }
    }
}
