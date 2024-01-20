//
//  EventInformationView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 13/01/24.
//

import SwiftUI

struct EventInformationView: View {
    let address: String
    let date: String
    let time: String
    let price: String

    var body: some View {
        VStack(spacing: 5) {
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        DvoraIcons.pin.image
                        Text(address)
                    }

                    HStack {
                        DvoraIcons.calendar.image
                        Text(date)
                    }
                }

                Spacer()

                VStack(alignment: .leading) {
                    HStack {
                        DvoraIcons.clock.image
                        Text(time)
                    }
                    HStack {
                        DvoraIcons.price.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18)
                        Text(price)
                    }
                }
            }
            .foregroundStyle(.gray)

            Button {
                print("RSVP tapped!")
            } label: {
                Text("RSVP")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.yellow)
            .foregroundStyle(.black)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .padding(.vertical, 20)

        }
    }
}

#Preview {
    EventInformationView(
        address: "155 second st",
        date: "10/08/2021",
        time: "9:00am-11:59pm",
        price: "Free"
    )
}
