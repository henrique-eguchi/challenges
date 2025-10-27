//
//  HTTPClient.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation

public enum HTTPClientError: Error, Equatable {
    case invalidData
    case connectivity
    case notFound
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), HTTPClientError>
    
    func get(from url: URL) async -> Result
    func post(to url: URL, with data: Data) async -> Result
}
