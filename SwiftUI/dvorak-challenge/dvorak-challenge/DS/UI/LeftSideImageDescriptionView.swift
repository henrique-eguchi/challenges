//
//  LeftSideImageDescriptionView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct LeftSideImageDescriptionView: View {
    var title: String
    var image: Image?

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    if let image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    Text(title)
                        .font(.title3)

                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    LeftSideImageDescriptionView(title: "Title", image: Image(systemName: "square.and.arrow.up"))
}
