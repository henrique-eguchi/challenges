//
//  bipa_ios_testApp.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import SwiftUI

@main
struct bipa_ios_testApp: App {
    var body: some Scene {
        WindowGroup {
            TopNodesListByConnectivityView(
                viewModel: TopNodesByConnectivityViewModel(
                    topNodesService: RemoteTopNodesByConnectivityService(
                        url: URL(string: "https://mempool.space/api/v1/lightning/nodes/rankings/connectivity")!,
                        client: URLSessionHTTPClient()
                    )
                )
            )
        }
    }
}
