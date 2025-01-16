//
//  TopNodeByConnectivityMapper.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import Foundation

final class TopNodeByConnectivityMapper {
    typealias TopNodeListServiceModel = [TopNodeServiceModel]

    struct TopNodeServiceModel: Decodable {
        let publicKey: String
        let alias: String
        let channels: Int
        let capacity: Int
        let firstSeen: Int
        let updatedAt: Int
        let city: LocatedNameServiceModel?
        let country: LocatedNameServiceModel?

        var topNode: TopNode {
            TopNode(
                publicKey: publicKey,
                alias: alias,
                channels: channels,
                capacity: capacity,
                firstSeen: firstSeen,
                updatedAt: updatedAt,
                city: city?.locatedName,
                country: country?.locatedName
            )
        }
    }

    struct LocatedNameServiceModel: Decodable {
        let en: String
        let ptBR: String?

        enum CodingKeys: String, CodingKey {
            case en
            case ptBR = "pt-BR"
        }

        var locatedName: String {
            ptBR ?? en
        }
    }

    static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteTopNodesByConnectivityService.Result {
        guard response.statusCode == HTTPStatusCode.OK_200,
              let root = try? JSONDecoder().decode(TopNodeListServiceModel.self, from: data) else {
            return .failure(RemoteTopNodesByConnectivityService.Error.invalidData)
        }
        return .success(root.map { $0.topNode })
    }
}
