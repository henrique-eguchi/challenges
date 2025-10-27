//
//  HTTPClientStub.swift
//  NTestTests
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation
@testable import NTest

class HTTPClientStub: HTTPClient {
    var getStub: ((URL) -> HTTPClient.Result)?
    var postStub: ((URL, Data) -> HTTPClient.Result)?
    
    func get(from url: URL) async -> HTTPClient.Result {
        return getStub?(url) ?? .failure(.connectivity)
    }
    
    func post(to url: URL, with data: Data) async -> HTTPClient.Result {
        return postStub?(url, data) ?? .failure(.connectivity)
    }
}
