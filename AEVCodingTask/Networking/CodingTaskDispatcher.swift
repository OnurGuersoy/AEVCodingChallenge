//
//  CodingTaskDispatcher.swift
//  AEVCodingTask
//
//  Created by Gürsoy Onur on 24.11.19.
//  Copyright © 2019 Gürsoy Onur. All rights reserved.
//

import Foundation


class CodingTaskDispatcher: Dispatcher {
    private var environment: Environment
    private let session: URLSession

    required init(environment: Environment) {
        self.environment = environment
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }

    func execute(request: Request, completion: @escaping (Response) -> Void) throws {
        let urlRequest = try createURLRequest(from: request)
        print(urlRequest)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            print(response ?? "Fuck you")
            let response = Response((response as? HTTPURLResponse, data, error), for: request)
            completion(response)
        }
        task.resume()
    }

    private func createURLRequest(from request: Request) throws -> URLRequest {
        let completeURL = "\(environment.baseURL)\(request.path)"
        guard let url = URL(string: completeURL) else {
            throw NetworkErrors.badInput
        }
        var urlRequest = URLRequest(url: url)

        switch request.parameters {
        case .body(let parameters):
            if let params = parameters {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [.sortedKeys, .prettyPrinted])
            } else {
                throw NetworkErrors.badInput
            }
        case .url(let parameters):
            if let params = parameters {
                let queryParams = params.map({ (element) -> URLQueryItem in
                    return URLQueryItem(name: element.key, value: element.value)
                })
                guard var components = URLComponents(string: completeURL) else {
                    throw NetworkErrors.badInput
                }
                components.queryItems = queryParams
                urlRequest.url = components.url
            }
        }

        environment.headers.forEach {urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)}
        request.headers?.forEach {urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)}
        urlRequest.httpMethod = request.method.rawValue

        return urlRequest
    }
}
