//
//  AliasRepositoryStub.swift
//  NTestTests
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation
@testable import NTest

class AliasRepositoryStub: AliasRepository {
    var aliases: [Alias] = []
    var shouldFail = false
    var error: AliasRepositoryError = .connectivity
    
    func shortenURL(_ url: String) async -> Result<Alias, AliasRepositoryError> {
        if shouldFail {
            return .failure(error)
        }

        let links = Links(selfURL: url, short: "https://short.url/\(aliases.count + 1)")
        let alias = Alias(alias: "alias\(aliases.count + 1)", links: links)
        aliases.insert(alias, at: 0)
        return .success(alias)
    }
    
    func getAliases() -> [Alias] {
        return aliases
    }
}
