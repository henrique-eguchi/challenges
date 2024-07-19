//
//  HTTPClient.swift
//  SanFranciscoFoodTrucks
//
//  Created by Henrique Akiyoshi Eguchi on 11/02/24.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    @discardableResult
    func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
