//
//  WideGradientRectangle.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct WideGradientRectangle: View {
    var gradientColors: [Color]

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
                LinearGradient(
                    gradient: Gradient(
                        colors: gradientColors
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(height: 100)
    }
}

#Preview {
    WideGradientRectangle(
        gradientColors: [
            DvoraColors.yellow,
            DvoraColors.yellow.opacity(0.5)
        ]
    )
}
