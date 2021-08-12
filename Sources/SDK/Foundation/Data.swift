//
//  Data.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


extension Data {

    // init?(mediaAttachment: MediaAttachment) {
    //   guard let mediaData = mediaAttachment.data else { return nil }
    //   self.init()
    //   append("--KankaKitBoundary\r\n")
    //   append(
    //     "Content-Disposition: form-data; name=\"file\"; filename=\"\(mediaAttachment.fileName)\"\r\n")
    //   append("Content-Type: \(mediaAttachment.mimeType)\r\n\r\n")
    //   append(mediaData)
    //   append("\r\n")
    //   append("--KankaKitBoundary--\r\n")
    // }

    mutating func append(_ string : String?) {
        guard let data = string?.data(using: .utf8) else {
            return
        }
        append(data)
    }
}
