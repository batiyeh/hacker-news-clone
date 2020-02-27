//
//  Endpoint.swift
//  HackerNews
//
//  Created by Brian Atiyeh on 2/26/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation

public enum HttpMethod: String {
    case GET
}

public protocol Endpoint {
    var method: HttpMethod { get }
    var baseUrl: String { get }
    var path: String { get }
    
    func buildUrl() -> URL?
}

public extension Endpoint {
    func buildUrlRequest() -> URLRequest? {
        guard let url = buildUrl() else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    func buildUrl() -> URL? {
        var urlString = self.baseUrl + self.path
        let url = URL(string: urlString)
        return url
    }
}
