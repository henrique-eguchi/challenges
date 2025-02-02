//
//  TopNodesByConnectivityServiceProtocol.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

protocol TopNodesByConnectivityServiceProtocol: AnyObject {
    typealias Result = Swift.Result<[TopNode], Error>

    func fetchTopNodesByConnectivity(completion: @escaping (Result) -> Void)
}
