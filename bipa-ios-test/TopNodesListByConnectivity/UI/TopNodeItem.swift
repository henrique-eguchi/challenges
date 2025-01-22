//
//  TopNodeItem.swift
//  bipa-ios-test
//
//  Created by Henrique Akiyoshi Eguchi on 15/01/25.
//

import SwiftUI

struct TopNodeItem: View {
    let node: TopNode
    @State private var isShowingClipboardMessage = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(node.alias)")
                            .font(.title2)
                            .truncationMode(.tail)
                            .lineLimit(1)
                            .foregroundStyle(Color("BipaLightBlue"))
                        Text("\(node.truncatedPublicKey)")
                            .onTapGesture {
                                UIPasteboard.general.string = node.publicKey
                                withAnimation {
                                    isShowingClipboardMessage = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation {
                                        isShowingClipboardMessage = false
                                    }
                                }
                            }
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("\(node.channelCountDescription) channels")
                            .font(.headline)
                            .bold()
                        Text("\(node.capacityInBTCDescription) BTC")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("First Seen: \(node.firstSeenDateTimeDescription)")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        Text("Updated: \(node.updatedAtDateTimeDescription)")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }

                    Spacer()
                    VStack(alignment: .trailing) {
                        if let city = node.city,
                           let country = node.country {
                            Text("\(city)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text("\(country)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        } else if let city = node.city {
                            Text("\(city)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        } else if let country = node.country {
                            Text("\(country)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding(5)
            .background(Color("BipaBackground"))

            if isShowingClipboardMessage {
                Text("Public key copied to the clipboard.")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
            }
        }
    }
}

#Preview {
    TopNodeItem(node: TopNode(publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f", alias: "ACINQ", channels: 2475, capacity: 70435829260, firstSeen: 1546452819, updatedAt: 1732857533, city: "New York", country: "United States"))
}
