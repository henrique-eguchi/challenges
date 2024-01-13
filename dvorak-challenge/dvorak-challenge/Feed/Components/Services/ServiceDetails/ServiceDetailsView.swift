//
//  ServiceDetailsView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct ServiceDetailsView: View {
    var service: ServiceModel

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                Image(service.details.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()

                HStack {
                    Text(service.details.description)
                        .padding()
                }

                Spacer()
            }
        }
        .navigationTitle(service.name)
    }
}

#Preview {
    ServiceDetailsView(service:
        ServiceModel(
            id: 1,
            name: "Cleaning",
            thumbnail: "Service1",
            details: ServiceDetailsModel(
                image: "Service1",
                description: "Cleaning description"
            )
        )
    )
}
