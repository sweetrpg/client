//
//  Request.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


public struct Request<Model : Codable> {
    let path : String
    let method : HTTPMethod

    init(path : String, method : HTTPMethod = .get(.empty)) {
        self.path = path
        self.method = method
    }

    init(service : Service, method : HTTPMethod = .get(.empty)) {
        self.path = service.path
        self.method = method
    }
}
