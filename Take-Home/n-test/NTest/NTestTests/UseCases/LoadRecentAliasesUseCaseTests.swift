//
//  LoadRecentAliasesUseCaseTests.swift
//  NTestTests
//
//  Created by A great candidate :D on 27/10/25.
//

import XCTest
@testable import NTest

final class LoadRecentAliasesUseCaseTests: XCTestCase {
    private var repositoryStub: AliasRepositoryStub!
    private var sut: LoadRecentAliasesUseCase!
    
    override func setUp() {
        super.setUp()
        repositoryStub = AliasRepositoryStub()
        sut = LoadRecentAliasesUseCase(repository: repositoryStub)
    }
    
    override func tearDown() {
        repositoryStub = nil
        sut = nil
        super.tearDown()
    }
    
    func test_execute_shouldReturnAliasesFromRepository() {
        let links1 = Links(selfURL: "https://www.example1.com", short: "https://short.url/1")
        let alias1 = Alias(alias: "alias1", links: links1)
        
        let links2 = Links(selfURL: "https://www.example2.com", short: "https://short.url/2")
        let alias2 = Alias(alias: "alias2", links: links2)
        
        repositoryStub.aliases = [alias1, alias2]

        let aliases = sut.execute()

        XCTAssertEqual(aliases.count, 2)
        XCTAssertEqual(aliases[0].alias, "alias1")
        XCTAssertEqual(aliases[1].alias, "alias2")
    }
    
    func test_execute_whenRepositoryIsEmpty_shouldReturnEmptyArray() {
        repositoryStub.aliases = []

        let aliases = sut.execute()

        XCTAssertTrue(aliases.isEmpty)
    }
}
