//
//  FeedView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                ScrollView(.vertical, showsIndicators: false) {
                    WelcomeView()
                    // MARK: - Events
                    BundlesView()
                    PromotionsView()
                    // MARK: - CoLab
                    // MARK: - Services
                }
            }
            .navigationTitle("DVORA")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    DvoraImages.logo.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("Notification tapped!")
                    }, label: {
                        Image(systemName: "bell")
                            .tint(DvoraColors.green)
                    })

                }
            }
        }
    }
}

#Preview {
    FeedView()
}
