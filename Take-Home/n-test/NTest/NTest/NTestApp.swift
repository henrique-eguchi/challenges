//
//  NTestApp.swift
//  NTest
//
//  Created by A great candidate :D on 25/10/25.
//

import SwiftUI

@main
struct NTestApp: App {
    private let baseURL = URL(string: "https://url-shortener-server.onrender.com")!
    private let httpClient = URLSessionHTTPClient()
    private let aliasRepository: AliasRepository
    private let shortenURLUseCase: ShortenURLUseCase
    private let loadRecentAliasesUseCase: LoadRecentAliasesUseCase
    private let viewModel: AliasListViewModel
    
    init() {
        aliasRepository = RemoteAliasRepository(client: httpClient, baseURL: baseURL)
        shortenURLUseCase = ShortenURLUseCase(repository: aliasRepository)
        loadRecentAliasesUseCase = LoadRecentAliasesUseCase(repository: aliasRepository)
        viewModel = AliasListViewModel(
            shortenURLUseCase: shortenURLUseCase,
            loadRecentAliasesUseCase: loadRecentAliasesUseCase
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ShortenURLView(viewModel: viewModel)
        }
    }
}
