//
//  NetworkService.swift
//  DailyEnglish
//
//  Created by Sevde Aydın on 1/19/25.
//

import Foundation

protocol NetworkService: AnyObject {
    func fetch<T: Decodable>(with endpoint: Endpoint) async throws -> T
}

final class NetworkManager: NetworkService {
    func fetch<T>(with endpoint: any Endpoint) async throws -> T where T : Decodable {
        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        request.allHTTPHeaderFields = endpoint.headers
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw NetworkError.invalidResponse
            }
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.unknown
        }
    }
}
