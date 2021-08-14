//
//  URLComponents.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking
#endif


extension URLComponents {

    init?<A>(baseURL : String, request : Request<A>) {
        guard let realBaseURL = URL(string: baseURL),
              let completeURL = URL(string: request.path, relativeTo: realBaseURL)
                else {
            return nil
        }

        self.init(url: completeURL, resolvingAgainstBaseURL: true)

        path = request.path
        queryItems = request.method.queryItems
    }

}
