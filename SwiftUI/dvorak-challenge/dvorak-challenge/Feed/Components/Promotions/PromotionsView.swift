//
//  PromotionsView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct PromotionsView: View {
    var viewModel = PromotionsViewModel()

    var body: some View {
        FeedItemStyleView(
            title: viewModel.title,
            showSeeAll: false
        ) {
            WideHorizontalBannerView(
                title: viewModel.description,
                gradientColors: [
                    DvoraColors.green,
                    DvoraColors.green.opacity(0.8)
                ],
                imageName: "star"
            )
            .onTapGesture {
                viewModel.fetchPromotion()
            }
        }
    }
}

#Preview {
    PromotionsView()
        .frame(height: 100)
}
