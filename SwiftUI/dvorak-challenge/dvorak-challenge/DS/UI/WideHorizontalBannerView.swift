//
//  WideHorizontalBannerView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct WideHorizontalBannerView: View {
    var title: String
    var gradientColors: [Color]
    var imageName: String?

    var body: some View {
        ZStack {
            WideGradientRectangle(gradientColors: gradientColors)

            HStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                Spacer()
                if let imageName {
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    WideHorizontalBannerView(
        title: "20% off on any Cleaning",
        gradientColors: [
            DvoraColors.green,
            DvoraColors.green.opacity(0.8)
        ],
        imageName: "star"
    )
}
