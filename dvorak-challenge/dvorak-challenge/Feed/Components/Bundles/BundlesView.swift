//
//  BundlesView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct BundlesView: View {
    var body: some View {
        FeedItemStyleView(title: "DVORA Bundles", showSeeAll: false) {
            WideVerticalBannerView(
                title: "Apartment & Amenities",
                subheading: "Tap here to create your bundle in 3 steps",
                gradientColors: [
                    DvoraColors.yellow,
                    DvoraColors.yellow.opacity(0.4)
                ]
            )
        }
        .onTapGesture {
            print("Bundle tapped!")
        }
    }
}

#Preview {
    BundlesView()
        .frame(height: 100)
}
