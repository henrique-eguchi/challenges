//
//  WideVerticalBannerView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct WideVerticalBannerView: View {
    var title: String
    var subheading: String
    var gradientColors: [Color]

    var body: some View {
        ZStack {
            WideGradientRectangle(gradientColors: gradientColors)

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.title)
                    Text(subheading)
                        .font(.subheadline)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    WideVerticalBannerView(title: "Apartment & Amenities", subheading: "Tap here to create your bundle in 3 steps", gradientColors: [DvoraColors.yellow, DvoraColors.yellow.opacity(0.4)])
}
