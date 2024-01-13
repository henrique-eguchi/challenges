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
            Text("Content")
        }
        .onTapGesture {
            print("Bundle tapped!")
        }
    }
}

#Preview {
    BundlesView()
}
