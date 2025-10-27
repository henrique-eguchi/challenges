//
//  NTestTests.swift
//  NTestTests
//
//  Created by A great candidate :D on 25/10/25.
//

import XCTest
@testable import NTest

final class NTestTests: XCTestCase {
    func test_init_AliasModelInitialization() throws {
        let links = Links(selfURL: "https://www.example.com", short: "https://short.url/abc123")

        let alias = Alias(alias: "abc123", links: links)

        XCTAssertEqual(alias.alias, "abc123")
        XCTAssertEqual(alias.links.selfURL, "https://www.example.com")
        XCTAssertEqual(alias.links.short, "https://short.url/abc123")
    }

    func testAliasIdModelInitialization() throws {
        let aliasId = AliasId(url: "https://www.example.com")
        
        XCTAssertEqual(aliasId.url, "https://www.example.com")
    }
}
