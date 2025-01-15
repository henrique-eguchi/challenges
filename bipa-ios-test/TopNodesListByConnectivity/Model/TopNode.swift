//
//  TopNode.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

struct TopNode {
    let publicKey: String
    let alias: String
    let channels: Int
    let capacity: Int // TODO: - Convert to BTC format
    let firstSeen: Int // TODO: - Convert from unix time to readable date and time
    let updatedAt: Int // TODO: - Convert from unix time to readable date and time
    let city: String?
    let country: String?

    var locationDescription: String? {
        if let city = city,
           let country = country {
            return "\(city), \(country)"
        } else if let city = city {
            return city
        } else if let country = country {
            return country
        } else {
            return nil
        }
    }
}
