//
//  Client.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


public struct Library : Service {
    static private let basePath = "/api/library"
    private var _path : String

    public var path : String {
        return Self.basePath + _path
    }

    public init(_ path : String) {
        self._path = path
    }
}
