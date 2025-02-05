//
//  UserEndpoint.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 1/19/25.
//

import Foundation

enum UserEndpoint: Endpoint {
    case onboarding(body: [String: Any])
    
    var baseURL: URL {
        return URL(string: "https://5p7whenc4a.execute-api.eu-central-1.amazonaws.com/")!
    }
    
    var path: String {
        return "prod/onboarding"
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var headers: [String: String]? {
            return ["Content-Type": "application/json"]
        }
    
    var body: [String : Any]? {
        switch self {
        case .onboarding(let body):
            return body
        }
    }
}
