//
//  TopNodesListByConnectivityView.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import SwiftUI

struct TopNodesListByConnectivityView: View {
    @StateObject var viewModel: TopNodesByConnectivityViewModel

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .initial:
                    Text("Initial")
                case .loading:
                    ProgressView()
                case .success(let nodes):
                    List(nodes) { node in
                        TopNodeItem(node: node)
                            .listRowBackground(
                                Color("BipaBackground")
                                    .cornerRadius(5)
                            )
                    }
                    .listRowSeparator(.hidden)
                    .listRowSpacing(10)
                case .failure(let error):
                    Text("Error fetching nodes: \(error.localizedDescription)")
                }
            }
            .navigationTitle("Top Nodes")
            .refreshable {
                viewModel.fetchNodes()
            }
            .onAppear {
                viewModel.fetchNodes()
            }
        }
    }
}

#Preview {
    TopNodesListByConnectivityView(
        viewModel: TopNodesByConnectivityViewModel(
            topNodesService: RemoteTopNodesByConnectivityService(
                url: URL(string: "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity")!,
                client: URLSessionHTTPClient()
            )
        )
    )
}
