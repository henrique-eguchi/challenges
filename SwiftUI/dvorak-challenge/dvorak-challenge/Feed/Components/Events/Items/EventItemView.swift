//
//  EventItemView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 13/01/24.
//

import Foundation
import SwiftUI

struct EventItemView: View {
    var thumbnail: String
    var description: String
    var locationText: String
    var dateText: String
    var timeText: String

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(8)

                VStack(alignment: .leading, spacing: 4) {
                    Text(description)
                        .font(.headline)
                        .foregroundStyle(.black)

                    IconDescriptionView(
                        iconImage: DvoraIcons.pin.image,
                        description: locationText
                    )

                    HStack(spacing: 16) {
                        IconDescriptionView(
                            iconImage: DvoraIcons.calendar.image,
                            description: dateText
                        )
                        IconDescriptionView(
                            iconImage: DvoraIcons.clock.image,
                            description: timeText
                        )
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 8)
            Divider()
        }
    }
}

#Preview {
    EventItemView(
        thumbnail: "Event1",
        description: "Wine Tasting",
        locationText: "Hamilton House",
        dateText: "05/01/21",
        timeText: "5:30pm"
    )
}
