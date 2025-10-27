//
//  URLSession+HTTPClient.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func get(from url: URL) async -> HTTPClient.Result {
        do {
            let (data, response) = try await session.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.invalidData)
            }
            return .success((data, httpResponse))
        } catch {
            return .failure(.connectivity)
        }
    }
    
    public func post(to url: URL, with data: Data) async -> HTTPClient.Result {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST
        request.setValue(HTTPHeaderValue.applicationJSON, forHTTPHeaderField: HTTPHeader.contentType)
        request.httpBody = data
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.invalidData)
            }
            return .success((data, httpResponse))
        } catch {
            return .failure(.connectivity)
        }
    }
}
