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
            Text("Promotions")
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
