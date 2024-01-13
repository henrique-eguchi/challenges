//
//  IconDescriptionView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 13/01/24.
//

import SwiftUI

struct IconDescriptionView: View {
    var iconImage: Image
    var description: String

    var body: some View {
        HStack(spacing: 3) {
            iconImage
                .foregroundStyle(.gray)

            Text(description)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    IconDescriptionView(
        iconImage: DvoraIcons.pin.image,
        description: "5th Ave"
    )
}
