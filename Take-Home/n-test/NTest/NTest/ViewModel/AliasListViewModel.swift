//
//  AliasListViewModel.swift
//  NTest
//
//  Created by A great candidate :D on 27/10/25.
//

import Foundation
import SwiftUI
import Combine

enum AliasListState: Equatable {
    case loading
    case loaded
    case error(String)
}

@MainActor
class AliasListViewModel: ObservableObject {
    @Published var aliases: [Alias] = []
    @Published var state: AliasListState = .loaded
    @Published var inputURL: String = ""
    
    private let shortenURLUseCase: ShortenURLUseCase
    private let loadRecentAliasesUseCase: LoadRecentAliasesUseCase
    
    init(
        shortenURLUseCase: ShortenURLUseCase,
        loadRecentAliasesUseCase: LoadRecentAliasesUseCase
    ) {
        self.shortenURLUseCase = shortenURLUseCase
        self.loadRecentAliasesUseCase = loadRecentAliasesUseCase
    }
    
    func shortenURL() async {
        guard !inputURL.isEmpty else { return }
        
        state = .loading
        let result = await shortenURLUseCase.execute(with: inputURL)
        
        switch result {
        case .success:
            aliases = loadRecentAliasesUseCase.execute()
            state = .loaded
            inputURL = ""
            
        case .failure(let error):
            switch error {
            case .invalidURL:
                state = .error("Invalid URL. Please enter a valid URL.")
            case .connectivity:
                state = .error("No connectivity. Please check your internet connection.")
            case .invalidData:
                state = .error("Invalid data received from server.")
            }
        }
    }
    
    func loadAliases() {
        aliases = loadRecentAliasesUseCase.execute()
    }
}
