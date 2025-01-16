//
//  RemoteTopNodesByConnectivityService.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import Foundation

final class RemoteTopNodesByConnectivityService: TopNodesByConnectivityServiceProtocol {
    private let url: URL
    private let client: HTTPClient

    enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    func fetchTopNodesByConnectivity(completion: @escaping (TopNodesByConnectivityServiceProtocol.Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }

            switch result {
            case let .success((data, response)):
                completion(TopNodeByConnectivityMapper.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
}
