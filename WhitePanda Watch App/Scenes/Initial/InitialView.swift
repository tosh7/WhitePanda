//
//  InitialView.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/08.
//

import SwiftUI
import ComposableArchitecture

struct InitialView: View {

    @Bindable var store: StoreOf<InitialFeature>

    var body: some View {
        VStack {
            Text("To start a new round,\n open your iPhone and set up!")
                .multilineTextAlignment(.center)

            Button(action: {
                store.send(.createFreeButtonTapped)
            }, label: {
                Text("Or free count mode")
            })
        }
        .navigationDestination(item: $store.scope(state: \.counterState, action: \.createFree), destination: { store in
            CounterView(store: store)
        })
        .navigationDestination(item: $store.scope(state: \.roundState, action: \.roundStart), destination: { store in
            RoundView(store: store)
        })
        .onAppear {
            store.send(.onAppear)
        }
    }
}

#Preview {
    InitialView(
        store: Store(initialState: InitialFeature.State()) {
            InitialFeature(watchConnecter: .init())
        }
    )
}
