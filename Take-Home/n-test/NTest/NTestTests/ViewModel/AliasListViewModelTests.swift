//
//  AliasListViewModelTests.swift
//  NTestTests
//
//  Created by A great candidate :D on 27/10/25.
//

import XCTest
@testable import NTest

@MainActor
final class AliasListViewModelTests: XCTestCase {
    private var repositoryStub: AliasRepositoryStub!
    private var shortenURLUseCase: ShortenURLUseCase!
    private var loadRecentAliasesUseCase: LoadRecentAliasesUseCase!
    private var sut: AliasListViewModel!
    
    override func setUp() {
        super.setUp()
        repositoryStub = AliasRepositoryStub()
        shortenURLUseCase = ShortenURLUseCase(repository: repositoryStub)
        loadRecentAliasesUseCase = LoadRecentAliasesUseCase(repository: repositoryStub)
        sut = AliasListViewModel(
            shortenURLUseCase: shortenURLUseCase,
            loadRecentAliasesUseCase: loadRecentAliasesUseCase
        )
    }
    
    override func tearDown() {
        repositoryStub = nil
        shortenURLUseCase = nil
        loadRecentAliasesUseCase = nil
        sut = nil
        super.tearDown()
    }
    
    func test_loadAliases_shouldUpdateAliasesProperty() {
        let links1 = Links(selfURL: "https://www.example1.com", short: "https://short.url/1")
        let alias1 = Alias(alias: "alias1", links: links1)
        
        let links2 = Links(selfURL: "https://www.example2.com", short: "https://short.url/2")
        let alias2 = Alias(alias: "alias2", links: links2)
        
        repositoryStub.aliases = [alias1, alias2]

        sut.loadAliases()

        XCTAssertEqual(sut.aliases.count, 2)
        XCTAssertEqual(sut.aliases[0].alias, "alias1")
        XCTAssertEqual(sut.aliases[1].alias, "alias2")
    }
    
    func test_shortenURL_withValidURL_shouldAddAliasToList() async throws {
        sut.inputURL = "https://www.example.com"

        await sut.shortenURL()

        XCTAssertEqual(sut.aliases.count, 1)
        XCTAssertEqual(sut.aliases[0].links.selfURL, "https://www.example.com")
        XCTAssertTrue(sut.inputURL.isEmpty)
    }
    
    func test_shortenURL_withInvalidURL_shouldSetErrorMessage() async throws {
        sut.inputURL = "invalid-url"

        await sut.shortenURL()

        if case .error(let message) = sut.state {
            XCTAssertEqual(message, "Invalid URL. Please enter a valid URL.")
        } else {
            XCTFail("Expected error state but got \(sut.state)")
        }
    }
    
    func test_shortenURL_withConnectivityError_shouldSetErrorMessage() async throws {
        sut.inputURL = "https://www.example.com"
        repositoryStub.shouldFail = true
        repositoryStub.error = .connectivity

        await sut.shortenURL()

        if case .error(let message) = sut.state {
            XCTAssertEqual(message, "No connectivity. Please check your internet connection.")
        } else {
            XCTFail("Expected error state but got \(sut.state)")
        }
    }
    
    func test_shortenURL_withInvalidDataError_setsErrorMessage() async throws {
        sut.inputURL = "https://www.example.com"
        repositoryStub.shouldFail = true
        repositoryStub.error = .invalidData

        await sut.shortenURL()

        if case .error(let message) = sut.state {
            XCTAssertEqual(message, "Invalid data received from server.")
        } else {
            XCTFail("Expected error state but got \(sut.state)")
        }
    }
    
    func test_shortenURL_withEmptyInput_shouldNotTriggerShortenURLService() async throws {
        sut.inputURL = ""

        await sut.shortenURL()

        XCTAssertEqual(sut.aliases.count, 0)
    }
}
