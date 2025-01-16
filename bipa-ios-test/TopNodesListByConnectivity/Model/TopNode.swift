//
//  TopNode.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import Foundation

struct TopNode: Identifiable {
    let publicKey: String
    let alias: String
    let channels: Int
    let capacity: Int
    let firstSeen: Int
    let updatedAt: Int
    let city: String?
    let country: String?
    var id: String { publicKey }

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

    var firstSeenDateTimeDescription: String {
        toDateString(from: firstSeen)
    }

    var updatedAtDateTimeDescription: String {
        toDateString(from: updatedAt)
    }

    private func toDateString(from unixTime: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        return dateFormatter.string(from: date)
    }

    var capacityInBTCDescription: String {
        satsToBTCFormatted(sats: Decimal(capacity))
    }

    private func satsToBTC(sats: Decimal) -> Decimal {
        let btcConversionFactor: Decimal = 100_000_000
        return sats / btcConversionFactor
    }

    private func satsToBTCFormatted(sats: Decimal) -> String {
        let nodeCapacityInBTC = satsToBTC(sats: sats)
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en-US")
        formatter.minimumFractionDigits = 8
        formatter.maximumFractionDigits = 8
        return formatter.string(from: nodeCapacityInBTC as NSDecimalNumber) ?? "Erro na formatação"
    }

    var channelCountDescription: String {
        formatChannelCount(channels)
    }

    private func formatChannelCount(_ count: Int) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en-US")
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1

        if count >= 1_000_000 {
            let millions = Double(count) / 1_000_000
            return formatter.string(for: millions)?.appending("M") ?? "\(count)"
        } else if count >= 1_000 {
            let thousands = Double(count) / 1_000
            return formatter.string(for: thousands)?.appending("K") ?? "\(count)"
        } else {
            return "\(count)"
        }
    }

    var truncatedPublicKey: String {
        truncateMiddle(text: publicKey, length: 15)
    }

    private func truncateMiddle(text: String, length: Int) -> String {
        guard text.count > length else { return text }

        let startIndex = text.startIndex
        let endIndex = text.index(startIndex, offsetBy: length / 2)
        let startIndex2 = text.index(text.endIndex, offsetBy: -(length / 2))

        let firstPart = String(text[startIndex..<endIndex])
        let lastPart = String(text[startIndex2..<text.endIndex])

        return "\(firstPart)...\(lastPart)"
    }
}
