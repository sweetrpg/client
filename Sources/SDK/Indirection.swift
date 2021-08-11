//
//  Indirection.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


public struct Indirect<T> {

    // Class wrapper to provide the actual indirection.
    private final class Wrapper {

        var value : T

        init(_ value : T) {
            self.value = value
        }
    }

    private var wrapper : Wrapper

    public init(_ value : T) {
        wrapper = Wrapper(value)
    }

    public var value : T {
        get {
            return wrapper.value
        }
        set {
            // upon mutation of value, if the wrapper class instance is unique,
            // simply mutate the underlying value directly.
            // otherwise, create a new instance.
            if isKnownUniquelyReferenced(&wrapper) {
                wrapper.value = newValue
            }
            else {
                wrapper = Wrapper(newValue)
            }
        }
    }
}
