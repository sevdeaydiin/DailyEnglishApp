//
//  Endpoint.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 1/19/25.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: [String: Any]? { get }
}

extension Endpoint {
    var url: URL? {
        return baseURL.appendingPathComponent(path)
    }
}
