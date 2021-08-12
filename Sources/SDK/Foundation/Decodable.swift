//
//  Decodable.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


extension Decodable {

    static func decode(data : Data) throws -> Self {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.serverFormatter)
        return try decoder.decode(Self.self, from: data)
    }
}
