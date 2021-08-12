//
//  Volumes.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation
import LibraryModel


/// `Volume` requests.
public enum Volumes {
    /// Gets the current set of volumes.
    ///
    /// - Returns: Request for `Profile`.
    public static func all(range : RequestRange = .default) -> Request<[Volume]> {
        let parameters = range.parameters(limit: between(1, and: 50, default: 25))
        let method = HTTPMethod.get(.parameters(parameters))
        return Request<[Volume]>(service: Library("/volumes"), method: method)
    }

    public static func volume(slug : String) -> Request<Volume> {
        Request<Volume>(service: Library("/volumes/\(slug)"))
    }
}
