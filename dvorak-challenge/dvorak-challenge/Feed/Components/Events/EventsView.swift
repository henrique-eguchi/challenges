//
//  EventsView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 13/01/24.
//

import SwiftUI

struct EventsView: View {
    @ObservedObject var viewModel: EventsViewModel = EventsViewModel()

    var body: some View {
        FeedItemStyleView(title: "Events", showSeeAll: true) {
            ForEach(viewModel.items, id: \.thumbnail) { item in
                NavigationLink(
                    destination: EventDetailsView(
                        viewModel: EventDetailsViewModel(event: item)
                    )
                ) {
                    EventItemView(
                        thumbnail: item.thumbnail,
                        description: item.description,
                        locationText: item.locationText,
                        dateText: item.dateText,
                        timeText: item.timeText
                    )
                }
                .padding(.vertical, 8)
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    EventsView()
        .frame(height: 250)
}
