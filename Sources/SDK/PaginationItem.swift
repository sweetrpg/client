//
//  PaginationItem.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


enum PaginationItemType : String {
    case next, prev
}

struct PaginationItem {
    let type : PaginationItemType
    let offset : Int
    let limit : Int?
}

extension PaginationItem {
    init?(webLink : String) {
        let segments = webLink.condensed()
                              .components(separatedBy: ";")

        let url = segments.first
                .map(trim(left: "<", right: ">"))
        let rel = segments.last?
                          .replacingOccurrences(of: "\"", with: "")
                          .trimmingCharacters(in: .whitespaces)
                          .components(separatedBy: "=")

        guard let validURL = url,
              let referenceKey = rel?.first,
              referenceKey == "rel",
              let referenceValue = rel?.last,
              let type = PaginationItemType(rawValue: referenceValue),
              let queryItems = URLComponents(string: validURL)?.queryItems
                else {
            return nil
        }

        let offset = queryItems.first {
            $0.name == "offset"
        }?
                .value
                .flatMap {
            Int($0)
        }
//        let maxID = queryItems.first {
//            $0.name == "max_id"
//        }?.value

        guard let offsetValue = offset else {
            return nil
        }

        self.type = type
        self.offset = offsetValue
        self.limit = queryItems.first {
                                   $0.name == "limit"
                               }
                               .flatMap(toInteger)
    }
}
