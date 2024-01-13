//
//  CoLabView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct CoLabView: View {
    var viewModel = CoLabViewModel()

    var body: some View {
        FeedItemStyleView(
            title: viewModel.title,
            showSeeAll: false
        ) {
            LeftSideImageDescriptionView(
                title: viewModel.description,
                image: DvoraImages.colab.image
            )
        }
    }
}

#Preview {
    CoLabView()
        .frame(height: 100)
}
