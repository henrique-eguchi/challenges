//
//  WelcomeView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct WelcomeView: View {
    var viewModel = WelcomeViewModel()

    var body: some View {
        HStack {
            Text(viewModel.greetings)
                .font(.title)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    WelcomeView()
}
