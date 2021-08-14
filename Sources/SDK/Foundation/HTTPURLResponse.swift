//
//  HTTPURLResponse.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif


extension HTTPURLResponse {

    var pagination : Pagination? {
        return allHeaderFields["Link"]
                .flatMap {
                    $0 as? String
                }
                .map(Pagination.init)
    }
}
