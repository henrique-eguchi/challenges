//
//  RemoteAliasRepositoryTests.swift
//  NTestTests
//
//  Created by A great candidate :D on 27/10/25.
//

import XCTest
@testable import NTest

@MainActor
final class RemoteAliasRepositoryTests: XCTestCase {
    private var mockHTTPClient: HTTPClientStub!
    private var repository: RemoteAliasRepository!
    private var baseURL: URL!
    
    override func setUp() {
        super.setUp()
        mockHTTPClient = HTTPClientStub()
        baseURL = URL(string: "https://url-shortener-server.onrender.com")!
        repository = RemoteAliasRepository(client: mockHTTPClient, baseURL: baseURL)
    }
    
    override func tearDown() {
        mockHTTPClient = nil
        repository = nil
        baseURL = nil
        super.tearDown()
    }
    
    func test_shortenURL_withValidURL_shouldreturnSuccess() async throws {
        let validURL = "https://www.example.com"
        mockHTTPClient.postStub = { _, _ in
            return .success((self.fakeAliasData, HTTPURLResponse(url: self.baseURL, statusCode: 200, httpVersion: nil, headerFields: nil)!))
        }

        let result = await repository.shortenURL(validURL)

        switch result {
        case .success(let alias):
            XCTAssertEqual(alias.alias, "1943772473")
            XCTAssertEqual(alias.links.selfURL, "https://nubank.com.br")
            XCTAssertEqual(alias.links.short, "https://url-shortener-server.onrender.com/api/alias/1943772473")
        case .failure:
            XCTFail("Expected success but got failure")
        }
    }
    
    func test_shortenURL_withInvalidURL_shouldReturnInvalidURLError() async throws {
        let invalidURL = "invalid-url"

        let result = await repository.shortenURL(invalidURL)

        switch result {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertEqual(error, .invalidURL)
        }
    }
    
    func test_shortenURL_withInvalidJSON_shouldReturnInvalidDataError() async throws {
        let validURL = "https://www.example.com"
        mockHTTPClient.postStub = { _, _ in
            return .success((Data(), HTTPURLResponse(url: self.baseURL, statusCode: 201, httpVersion: nil, headerFields: nil)!))
        }

        let result = await repository.shortenURL(validURL)

        switch result {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertEqual(error, .invalidData)
        }
    }
    
    func test_shortenURL_withNon201StatusCode_shouldReturnInvalidDataError() async throws {
        let validURL = "https://www.example.com"
        mockHTTPClient.postStub = { _, _ in
            return .success((self.fakeAliasData, HTTPURLResponse(url: self.baseURL, statusCode: 400, httpVersion: nil, headerFields: nil)!))
        }

        let result = await repository.shortenURL(validURL)

        switch result {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertEqual(error, .invalidData)
        }
    }
    
    func test_shortenURL_withConnectivityError_shouldReturnsConnectivityError() async throws {
        let validURL = "https://www.example.com"
        mockHTTPClient.postStub = { _, _ in
            return .failure(.connectivity)
        }

        let result = await repository.shortenURL(validURL)

        switch result {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertEqual(error, .connectivity)
        }
    }
    
    func test_getAliases_shouldReturnStoredAliases() async throws {
        let validURL = "https://www.example.com"
        mockHTTPClient.postStub = { _, _ in
            return .success((self.fakeAliasData, HTTPURLResponse(url: self.baseURL, statusCode: 200, httpVersion: nil, headerFields: nil)!))
        }
        _ = await repository.shortenURL(validURL)

        let aliases = repository.getAliases()

        guard aliases.count == 1 else {
            XCTFail("Expected one alias but got \(aliases.count) instead")
            return
        }
        XCTAssertEqual(aliases.count, 1)
        XCTAssertEqual(aliases[0].alias, "1943772473")
    }

    private var fakeAliasData: Data {
        let fakeAliasJsonString = """
            {
              "alias": "1943772473",
              "_links": {
                "self": "https://nubank.com.br",
                "short": "https://url-shortener-server.onrender.com/api/alias/1943772473"
              }
            }
            """
        guard let jsonData = fakeAliasJsonString.data(using: .utf8) else {
            XCTFail("Could not convert JSON string to Data.")
            return Data()
        }

        return jsonData
    }
}
