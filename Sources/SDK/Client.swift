//
//  Client.swift
//  SweetRPG SDK
//
//  Created by Paul Schifferer on 4/22/17.
//  Copyright © 2021 SweetRPG. All rights reserved.
//

import Foundation
import Logging


public struct Client : ClientType {
    let baseURL : String
    let session : URLSession
    public var accessToken : String?

    let logger = Logger(label: "com.sweetrpg.client")

    public init(baseURL : String, accessToken : String? = nil, session : URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
        self.accessToken = accessToken
    }

    public func run<Model>(_ request : Request<Model>, completion : @escaping (Result<Model>) -> Void) {
        guard let components = URLComponents(baseURL: baseURL, request: request),
                let url = components.url
                else {
            logger.warning("Malformed URL in request: \(request)")
            completion(.failure(ClientError.malformedURL))
            return
        }

        let urlRequest = URLRequest(url: url, request: request, accessToken: accessToken)
        logger.debug("urlRequest: \(urlRequest)")
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                logger.error("Request failed with error: \(error)")
                completion(.failure(error))
                return
            }

            guard let data = data else {
                logger.error("Malformed response; no data.")
                completion(.failure(ClientError.malformedJSON))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200
                    else {
                logger.warning("Unexpected response: \(response)")
                // TODO
//                let serverError = try? ServerError.decode(data: data)
//                let error: ClientError =
//                        serverError.map { .serverError($0.description) } ?? .genericError
//                completion(.failure(error))
                return
            }

            guard let model = try? Model.decode(data: data) else {
                logger.error("Response model failed to decode: \(data)")
                completion(.failure(ClientError.invalidModel))
                return
            }

            logger.info("Request completed.")
            completion(.success(model, httpResponse.pagination))
        }

        logger.info("Resuming URL session data task: \(task)")
        task.resume()
    }
}
