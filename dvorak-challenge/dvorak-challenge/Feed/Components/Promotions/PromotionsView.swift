//
//  PromotionsView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct PromotionsView: View {
    var body: some View {
        FeedItemStyleView(title: "Promotions", showSeeAll: false) {
            WideHorizontalBannerView(
                title: "20% of on any Cleaning",
                gradientColors: [
                    DvoraColors.green,
                    DvoraColors.green.opacity(0.8)
                ],
                imageName: "star"
            )
            .onTapGesture {
                print("Promotion tapped!")
            }
        }
    }
}

#Preview {
    PromotionsView()
        .frame(height: 100)
}
