//
//  TopNodeByConnectivityMapper.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

final class TopNodeByConnectivityMapper {
    struct TopNode: Decodable {
        let publicKey: String
        let alias: String
        let channels: Int
        let capacity: Int
        let firstSeen: Int
        let updatedAt: Int
        let city: LocatedName?
        let country: LocatedName?
    }

    struct LocatedName: Decodable {
        let en: String
        let ptBR: String?
    }
}
