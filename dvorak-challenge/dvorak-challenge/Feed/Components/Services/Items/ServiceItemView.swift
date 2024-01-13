//
//  ServiceItemView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct ServiceItemView: View {
    var service: ServiceModel

    var body: some View {
        VStack(alignment: .center) {
            Image(service.thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(10)

            Text(service.name)
                .font(.footnote)
                .truncationMode(.tail)
                .foregroundStyle(.black)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}
#Preview {
    ServiceItemView(
        service: ServiceModel(
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
