//
//  FilledButtonStyle.swift
//  WhitePanda
//
//  Created by Satoshi Komatsu on 2024/08/24.
//

import SwiftUI

struct FilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
