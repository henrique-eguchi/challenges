//
//  AliasMapper.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation

final class AliasMapper {
    struct AliasServiceModel: Decodable {
        let alias: String
        let links: LinksServiceModel

        enum CodingKeys: String, CodingKey {
            case alias
            case links = "_links"
        }

        var aliasModel: Alias {
            Alias(alias: alias, links: links.linksModel)
        }
    }

    struct LinksServiceModel: Decodable {
        let selfURL: String
        let short: String

        enum CodingKeys: String, CodingKey {
            case selfURL = "self"
            case short
        }

        var linksModel: Links {
            Links(
                selfURL: selfURL,
                short: short
            )
        }
    }

    static func map(_ data: Data, from response: HTTPURLResponse) -> Result<Alias, AliasRepositoryError> {
        guard response.statusCode == HTTPStatusCode.OK_200,
              let alias = try? JSONDecoder().decode(AliasServiceModel.self, from: data)
        else {
            return .failure(.invalidData)
        }

        return .success(alias.aliasModel)
    }
}
