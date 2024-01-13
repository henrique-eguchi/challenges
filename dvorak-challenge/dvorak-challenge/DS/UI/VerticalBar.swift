//
//  VerticalBar.swift
//  dvorak-challenge
//
//  Created by Henrique Akiyoshi Eguchi on 12/01/24.
//

import SwiftUI

struct VerticalBar: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(DvoraColors.yellow)
                .frame(width: 5)
            Spacer()
        }
    }
}

#Preview {
    VerticalBar()
}
