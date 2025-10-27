//
//  AliasRepository.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation

protocol AliasRepository {
    func shortenURL(_ url: String) async -> Result<Alias, AliasRepositoryError>
    func getAliases() -> [Alias]
}
