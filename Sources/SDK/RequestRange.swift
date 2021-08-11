//
//  RequestRange.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


public enum RequestRange {
    /// Gets a list with IDs less than or equal this value.
    case max(id : String, limit : Int?)
    /// Gets a list with IDs greater than this value.
    case since(id : String, limit : Int?)
    /// Sets the maximum number of entities to get.
    case limit(Int)
    /// Applies the default values.
    case `default`
}

extension RequestRange {
    func parameters(limit limitFunction : (Int) -> Int) -> [Parameter]? {
        switch self {
        case .max(let id, let limit):
            return [
                Parameter(name: "max_id", value: id),
                Parameter(name: "limit", value: limit.map(limitFunction).flatMap(toOptionalString)),
            ]
        case .since(let id, let limit):
            return [
                Parameter(name: "since_id", value: id),
                Parameter(name: "limit", value: limit.map(limitFunction).flatMap(toOptionalString)),
            ]
        case .limit(let limit):
            return [ Parameter(name: "limit", value: String(limitFunction(limit))) ]
        default:
            return nil
        }
    }
}

// MARK: - Equatable
extension RequestRange : Equatable {}
