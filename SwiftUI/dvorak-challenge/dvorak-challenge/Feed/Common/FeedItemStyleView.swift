//
//  FeedItemStyleView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct FeedItemStyleView<Content: View>: View {
    var title: String
    // TODO: - Just a flag - in a real-world scenario we would have a closure for the 'button' event as well
    var showSeeAll: Bool
    @ViewBuilder var content: () -> Content

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ItemHeaderView(
                    title: title,
                    buttonText: showSeeAll ? "See All" : "",
                    destination: Text("See All List - TBD")
                )
                .padding(.horizontal)

                content()
            }
            VerticalBar()
        }
        .padding(.top)
    }
}

#Preview {
    FeedItemStyleView(title: "Services", showSeeAll: true) {
        Text("Content")
    }
}
