//
//  TopNodeTests.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

@testable import bipa_ios_test
import XCTest

class TopNodeTests: XCTestCase {
    func test_locationDescription_shouldMatchDescription_whenProvided() {
        let node1 = TopNode.fixture(city: "São Paulo", country: "Brasil")
        XCTAssertEqual(node1.locationDescription, "São Paulo, Brasil")

        let node2 = TopNode.fixture(city: "New York", country: nil)
        XCTAssertEqual(node2.locationDescription, "New York")

        let node3 = TopNode.fixture(city: nil, country: "United States")
        XCTAssertEqual(node3.locationDescription, "United States")

        let node4 = TopNode.fixture(city: nil, country: nil)
        XCTAssertNil(node4.locationDescription)
    }

    func test_firstSeenDateTimeDescription_shouldConvertToCorrectDateAndTime() {
        let node = TopNode.fixture(firstSeen: 1736990721)

        XCTAssertEqual(node.firstSeenDateTimeDescription, "2025/01/15 22:25")
    }

    func test_updatedAtDateTimeDescription_shouldConvertToCorrectDateAndTime() {
        let node = TopNode.fixture(updatedAt: 1736990721)

        XCTAssertEqual(node.updatedAtDateTimeDescription, "2025/01/15 22:25")
    }

    func test_capacityInBTCDescription_shouldConvertToBTC() {
        let node = TopNode.fixture(capacity: 550000)

        XCTAssertEqual(node.capacityInBTCDescription, "0.00550000")
    }

}
