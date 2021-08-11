//
//  Pagination.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


public struct Pagination {
    /// The request range for fetching the next page.
    public let next : RequestRange?
    /// The request range for fetching the previous page.
    public let previous : RequestRange?
}

extension Pagination {
    init(string : String) {
        let links =
                string
                        .components(separatedBy: ",")
                        .compactMap(PaginationItem.init)

        var nextLink : RequestRange?
        var previousLink : RequestRange?

        for link in links {
            switch link.type {
            case .next: nextLink = .max(id: link.id, limit: link.limit)
            case .prev: previousLink = .since(id: link.id, limit: link.limit)
            }
        }

        self.next = nextLink
        self.previous = previousLink
    }
}

// MARK: - Equatable
extension Pagination : Equatable {}
