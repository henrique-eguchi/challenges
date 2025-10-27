//
//  RemoteAliasRepository.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation

final class RemoteAliasRepository: AliasRepository {
    private let client: HTTPClient
    private let baseURL: URL
    private var aliases: [Alias] = [] // In-memory aliases

    init(client: HTTPClient, baseURL: URL) {
        self.client = client
        self.baseURL = baseURL
    }
    
    func shortenURL(_ urlString: String) async -> Result<Alias, AliasRepositoryError> {
        let requestData = ["url": urlString]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestData) else {
            return .failure(.invalidData)
        }

        let endpoint = baseURL.appendingPathComponent("api/alias")
        let result = await client.post(to: endpoint, with: jsonData)
        
        switch result {
        case let .success((data, response)):

            let aliasResult = AliasMapper.map(data, from: response)
            if case let .success(alias) = aliasResult {
                aliases.insert(alias, at: 0)
            }

            return aliasResult

        case let .failure(error):
            switch error {
            case .connectivity:
                return .failure(.connectivity)
            default:
                return .failure(.invalidData)
            }
        }
    }
    
    func getAliases() -> [Alias] {
        return aliases
    }
}
