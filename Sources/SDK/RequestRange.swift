//
//  RequestRange.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


public enum RequestRange {
    /// Gets a list starting at offset, up to an upper offset, inclusive.
    case from(offset : Int, to : Int?)
    /// Gets a list starting at offset
    case startingAt(offset : Int, limit : Int?)
    /// Applies the default values.
    case `default`
}

extension RequestRange {
    func parameters(limit limitFunction : (Int) -> Int) -> [Parameter]? {
        switch self {
        case .from(let start, let end):
            guard (end ?? 0) >= start else { return nil }
            return [
                Parameter(name: "offset", value: String(start)),
                Parameter(name: "limit", value: String(((end ?? start) - start) + 1))
            ]

        case .startingAt(let offset, let limit):
            return [
                Parameter(name: "offset", value: String(offset)),
                Parameter(name: "limit", value: limit.map(limitFunction).flatMap(toOptionalString)),
            ]

//        case .limit(let limit):
//            return [ Parameter(name: "limit", value: String(limitFunction(limit))) ]

        default:
            return nil
        }
    }
}

// MARK: - Equatable
extension RequestRange : Equatable {}
