//
//  DvoraIcons+SwiftUI.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import Foundation
import SwiftUI

public extension DvoraIcons {
    var image: Image {
        Image(self.rawValue)
            .renderingMode(.template)
    }
}
