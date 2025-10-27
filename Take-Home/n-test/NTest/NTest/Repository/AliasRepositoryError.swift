//
//  AliasRepositoryError.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation

enum AliasRepositoryError: Error, Equatable {
    case invalidURL
    case connectivity
    case invalidData
}
