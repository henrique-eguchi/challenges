//
//  EventDetailsViewModel.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 13/01/24.
//

import Foundation

final class EventDetailsViewModel: ObservableObject {
    // TODO: - Real-world scenario - get specific details from API
    let price = "Free"
    let description = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin blandit dui mauris, ut malesuada massa posuere nec. Etiam elementum venenatis tellus ac efficitur. Cras ultrices lorem turpis, sit amet interdum est eleifend vitae. Maecenas placerat ornare sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer dictum bibendum elit a varius.
    """

    @Published var event: EventItemModel

    init(event: EventItemModel) {
        self.event = event
    }
}
