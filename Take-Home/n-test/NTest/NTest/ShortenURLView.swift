//
//  ShortenURLView.swift
//  NTest
//
//  Created by A great candidate :D on 25/10/25.
//

import SwiftUI

struct ShortenURLView: View {
    @StateObject private var viewModel: AliasListViewModel

    init(viewModel: AliasListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                HStack {
                    TextField("Enter URL to shorten", text: $viewModel.inputURL)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.URL)
                        .disabled(viewModel.state == .loading)

                    Button("Shorten") {
                        Task {
                            await viewModel.shortenURL()
                        }
                    }
                    .disabled(viewModel.inputURL.isEmpty || viewModel.state == .loading)
                }
                .padding()

                if viewModel.state == .loading {
                    ProgressView("Shortening URL...")
                        .progressViewStyle(CircularProgressViewStyle())
                }

                if case .error(let message) = viewModel.state {
                    Text(message)
                        .foregroundColor(.red)
                }

                List(viewModel.aliases, id: \.alias) { alias in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(alias.links.short)
                            .font(.headline)
                            .foregroundColor(.blue)
                        
                        Text(alias.links.selfURL)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    }
                    .padding(.vertical, 4)
                }

                Spacer()
            }
            .navigationTitle("URL Shortener")
            .onAppear {
                viewModel.loadAliases()
            }
        }
    }
}

#Preview {
    let client = URLSessionHTTPClient()
    let baseURL = URL(string: "https://url-shortener-server.onrender.com")!
    let repository = RemoteAliasRepository(client: client, baseURL: baseURL)
    let shortenUseCase = ShortenURLUseCase(repository: repository)
    let loadUseCase = LoadRecentAliasesUseCase(repository: repository)
    let viewModel = AliasListViewModel(
        shortenURLUseCase: shortenUseCase,
        loadRecentAliasesUseCase: loadUseCase
    )
    
    return ShortenURLView(viewModel: viewModel)
}
