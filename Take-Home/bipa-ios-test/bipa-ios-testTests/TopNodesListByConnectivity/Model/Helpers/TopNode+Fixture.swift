//
//  TopNode+Fixture.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

@testable import bipa_ios_test

extension TopNode {
    static func fixture(
        publicKey: String = "anyString",
        alias: String = "anyString",
        channels: Int = 0,
        capacity: Int = 0,
        firstSeen: Int = 0,
        updatedAt: Int = 0,
        city: String? = nil,
        country: String? = nil
    ) -> TopNode {
        .init(
            publicKey: publicKey,
            alias: alias,
            channels: channels,
            capacity: capacity,
            firstSeen: firstSeen,
            updatedAt: updatedAt,
            city: city,
            country: country
        )
    }
}
