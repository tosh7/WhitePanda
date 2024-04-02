//
//  HomeView.swift
//  WhitePanda
//
//  Created by satoshi on 2024/04/01.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {

    let store: StoreOf<Home>

    var body: some View {
        VStack {
            Text("Welcome to Golf Counter")

            Button("Create New Round", action: {
                store.send(.createNewRound)
            })

            Button("See past results", action: {
                store.send(.seePastRound)
            })
        }

    }
}

#Preview {
    HomeView(
        store: Store(initialState: Home.State()) {
            Home()
        }
    )
}
