//
//  ClientError.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


public enum ClientError : Error {
    /// Failed to build the URL to make the request.
    case malformedURL
    /// Failed to parse the server's JSON reponse.
    case malformedJSON
    /// Failed to parse server's model.
    case invalidModel
    /// Generic error.
    case genericError
    /// The service returned an error.
    case serverError(String)
}
