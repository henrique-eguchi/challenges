//
//  ViewState.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import Foundation

enum ViewState<T> {
    case initial
    case loading
    case success(T)
    case failure(Error)
}
