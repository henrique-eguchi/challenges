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
        VStack(alignment: .leading) {
            Text("🏷️ Alias: \(node.alias)")
                .font(.subheadline)
            ZStack {
                Text("🔑 PublicKey: \(node.truncatedPublicKey)")
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
                    .font(.subheadline)
                if isShowingClipboardMessage {
                    Text("Public key copied to the clipboard.")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(5)
                }
            }
            Text("🔀 Channels: \(node.channelCountDescription)")
                .font(.subheadline)
            Text("⚡️ Capacity: \(node.capacityInBTCDescription) BTC")
                .font(.subheadline)
            Text("🧐 First Seen: \(node.firstSeenDateTimeDescription)")
                .font(.subheadline)
            Text("🔄 Updated At: \(node.updatedAtDateTimeDescription)")
                .font(.subheadline)
            if let location = node.locationDescription,
               !location.isEmpty {
                Text("📍 Location: \(location)")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    TopNodeItem(node: TopNode(publicKey: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f", alias: "ACINQ", channels: 2475, capacity: 70435829260, firstSeen: 1546452819, updatedAt: 1732857533, city: "New York", country: "United States"))
}
