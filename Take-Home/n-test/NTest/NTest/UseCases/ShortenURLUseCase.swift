//
//  ShortenURLUseCase.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation

final class ShortenURLUseCase {
    private let repository: AliasRepository
    
    init(repository: AliasRepository) {
        self.repository = repository
    }
    
    func execute(with urlString: String) async -> Result<Alias, AliasRepositoryError> {
        guard let url = URL(string: urlString),
              url.scheme != nil,
              url.host != nil else {
            return .failure(.invalidURL)
        }

        return await repository.shortenURL(urlString)
    }
}
