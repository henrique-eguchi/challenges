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
        let node = TopNode.fixture(capacity: 550_000)

        XCTAssertEqual(node.capacityInBTCDescription, "0.00550000")
    }

    func test_channelCountDescription_shouldMathExpectedValues() throws {
        let node1 = TopNode.fixture(channels: 1_234)
        XCTAssertEqual(node1.channelCountDescription, "1.2K")

        let node2 = TopNode.fixture(channels: 1_234_567)
        XCTAssertEqual(node2.channelCountDescription, "1.2M")

        let node3 = TopNode.fixture(channels: 999)
        XCTAssertEqual(node3.channelCountDescription, "999")

        let node4 = TopNode.fixture(channels: 1_000_000)
        XCTAssertEqual(node4.channelCountDescription, "1M")
    }

    func test_truncatedPublicKey() throws {
        let node1 = TopNode.fixture(publicKey: "02c64994106fd6b1c9d6725cc88dc0f19681e23a1a85f19c1109332c096c1befd7")
        XCTAssertEqual(node1.truncatedPublicKey, "02c6499...c1befd7")

        let node2 = TopNode.fixture(publicKey: "02c64994c9d6725")
        XCTAssertEqual(node2.truncatedPublicKey, "02c64994c9d6725")
    }

}
