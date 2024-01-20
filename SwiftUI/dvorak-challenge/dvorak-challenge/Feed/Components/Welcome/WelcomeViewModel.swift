//
//  WelcomeViewModel.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import Foundation

final class WelcomeViewModel {
    // TODO: - Get from local /user session / user defaults / ...
    var name = "Henrique"
    var greetings: String {
        "Welcome, \(name)!"
    }
}
