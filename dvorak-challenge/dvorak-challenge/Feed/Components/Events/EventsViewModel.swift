//
//  EventsViewModel.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 13/01/24.
//

import Foundation

final class EventsViewModel: ObservableObject {
    @Published var items: [EventItemModel] = [
        EventItemModel(
            thumbnail: "Event1",
            description: "Wine Tasting",
            locationText: "Hamilton House",
            dateText: "05/01/21",
            timeText: "5:30pm"
        ),
        EventItemModel(
            thumbnail: "Event2",
            description: "Rooftop Yoga with Kendra",
            locationText: "Art House",
            dateText: "05/15/21",
            timeText: "10:00am"
        ),
        EventItemModel(
            thumbnail: "Event3",
            description: "Earth Day Celebration",
            locationText: "175 Second",
            dateText: "05/25/21",
            timeText: "7:45pm"
        )
    ]
}
