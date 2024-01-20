//
//  ServicesView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct ServicesView: View {
    @StateObject var viewModel = ServicesViewModel()

    var body: some View {
        FeedItemStyleView(
            title: viewModel.title,
            showSeeAll: true
        ) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(viewModel.services, id: \.id) { service in
                        NavigationLink(destination: ServiceDetailsView(service: service)) {
                            ServiceItemView(service: service)
                        }
                    }
                }
                .padding(.top, 8)
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

#Preview {
    ServicesView()
}
