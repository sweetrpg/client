//
//  ClientType.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation


public protocol ClientType {
    /// The user access token used to perform the network requests.
    var accessToken : String? { get set }

    /// Kanka Client's initializer.
    ///
    /// - Parameters:
    ///   - baseURL: The Kanka instance URL
    ///   - accessToken: The user access token used to perform the network requests (optional).
    ///   - session: The URLSession used to perform the network requests.
    init(baseURL : String, accessToken : String?, session : URLSession)

    /// Performs the network request.
    ///
    /// - Parameters:
    ///   - request: The request to be performed.
    ///   - completion: The completion block to be called when the request is complete.
    ///   - result: The request result.
    func run<Model>(_ request : Request<Model>, completion : @escaping (_ result : Result<Model>) -> Void)
}
