//
//  BundlesView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct BundlesView: View {
    var viewModel = BundlesViewModel()

    var body: some View {
        FeedItemStyleView(
            title: viewModel.title,
            showSeeAll: false
        ) {
            WideVerticalBannerView(
                title: viewModel.description,
                subheading: viewModel.bundleTip,
                gradientColors: [
                    DvoraColors.yellow,
                    DvoraColors.yellow.opacity(0.4)
                ]
            )
        }
        .onTapGesture {
            viewModel.fetchBundle()
        }
    }
}

#Preview {
    BundlesView()
        .frame(height: 100)
}
