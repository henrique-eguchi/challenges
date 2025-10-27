//
//  ShortenURLUseCaseTests.swift
//  NTestTests
//
//  Created by A great candidate :D on 27/10/25.
//

import XCTest
@testable import NTest

@MainActor
final class ShortenURLUseCaseTests: XCTestCase {
    private var repositoryStub: AliasRepositoryStub!
    private var sut: ShortenURLUseCase!
    
    override func setUp() {
        super.setUp()
        repositoryStub = AliasRepositoryStub()
        sut = ShortenURLUseCase(repository: repositoryStub)
    }
    
    override func tearDown() {
        repositoryStub = nil
        sut = nil
        super.tearDown()
    }
    
    func test_execute_withValidURL_shouldReturnSuccess() async throws {
        let validURL = "https://www.example.com"

        let result = await sut.execute(with: validURL)

        switch result {
        case .success(let alias):
            XCTAssertEqual(alias.links.selfURL, validURL)
            XCTAssertFalse(alias.alias.isEmpty)
        case .failure:
            XCTFail("Expected success but got failure")
        }
    }
    
    func test_execute_withInvalidURL_shouldReturnInvalidURLError() async throws {
        let invalidURL = "invalid-url"

        let result = await sut.execute(with: invalidURL)

        switch result {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertEqual(error, .invalidURL)
        }
    }
    
    func test_execute_withStubbedRepositoryError_shouldReturnError() async throws {
        let validURL = "https://www.example.com"
        repositoryStub.shouldFail = true
        repositoryStub.error = .connectivity

        let result = await sut.execute(with: validURL)

        switch result {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertEqual(error, .connectivity)
        }
    }
}
