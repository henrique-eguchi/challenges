//
//  ItemHeaderView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct ItemHeaderView<Destination: View>: View {
    let title: String
    var buttonText: String?
    let destination: Destination

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)

            Spacer()

            NavigationLink(destination: destination) {
                Text(buttonText ?? "")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ItemHeaderView(title: "Services", buttonText: "See All", destination: Text("TBD"))
}
