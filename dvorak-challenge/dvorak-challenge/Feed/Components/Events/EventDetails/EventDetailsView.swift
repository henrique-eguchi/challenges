//
//  EventDetailsView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 13/01/24.
//

import SwiftUI

struct EventDetailsView: View {
    @ObservedObject var viewModel: EventDetailsViewModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                Image(viewModel.event.thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()

                VStack(alignment: .leading, spacing: 5) {
                    Text(viewModel.event.description)
                        .font(.title)
                        .padding(.bottom, 10)

                    Text(viewModel.description)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)

                Divider()

                EventInformationView(
                    address: viewModel.event.locationText,
                    date: viewModel.event.dateText,
                    time: viewModel.event.timeText,
                    price: viewModel.price
                )
                    .padding(.horizontal)
            }
        }
        .navigationTitle(viewModel.event.description)
    }
}

#Preview {
    EventDetailsView(
        viewModel: EventDetailsViewModel(
            event: EventItemModel(
                thumbnail: "Event1",
                description: "Wine Tasting",
                locationText: "Hamilton House",
                dateText: "05/01/21",
                timeText: "5:30pm"
            )
        )
    )
}
