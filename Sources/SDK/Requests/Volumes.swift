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
    public static func all() -> Request<[Volume]> {
        return Request<[Volume]>(service: Library("/volumes"))
    }
}
