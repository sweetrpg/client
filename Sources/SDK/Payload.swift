//
//  Payload.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


enum Payload {
    case parameters([Parameter]?)
//   case media(MediaAttachment?)
    case empty
}

extension Payload {

    var items : [URLQueryItem]? {
        switch self {
        case .parameters(let parameters): return parameters?.compactMap(toQueryItem)
                // case .media: return nil
        case .empty: return nil
        }
    }

    var data : Data? {
        switch self {
        case .parameters(let parameters):
            return parameters?
                    .compactMap(toString)
                    .joined(separator: "&")
                    .data(using: .utf8)
                // case .media(let mediaAttachment): return mediaAttachment.flatMap(Data.init)
        case .empty: return nil
        }
    }

    var type : String? {
        switch self {
        case .parameters(let parameters):
            return parameters.map { _ in
                "application/x-www-form-urlencoded; charset=utf-8"
            }
                // case .media(let mediaAttachment):
                //   return mediaAttachment.map { _ in "multipart/form-data; boundary=KankaKitBoundary" }
        case .empty: return nil
        }
    }
}
