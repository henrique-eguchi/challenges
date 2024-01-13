//
//  WelcomeView.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct WelcomeView: View {
    let name = "Henrique"

    var body: some View {
        HStack {
            Text("Welcome, \(name)!")
                .font(.title)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    WelcomeView()
}
