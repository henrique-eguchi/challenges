//
//  LoadRecentAliasesUseCase.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation

final class LoadRecentAliasesUseCase {
    private let repository: AliasRepository
    
    init(repository: AliasRepository) {
        self.repository = repository
    }
    
    func execute() -> [Alias] {
        return repository.getAliases()
    }
}
