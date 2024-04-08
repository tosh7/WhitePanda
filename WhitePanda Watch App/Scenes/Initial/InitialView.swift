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
        }.sheet(item: $store.scope(state: \.counterState, action: \.createFree), content: { store in
            CounterView(store: store)
        })
    }
}

#Preview {
    InitialView(
        store: Store(initialState: InitialFeature.State(watchConnecter: .init())) {
            InitialFeature()
        }
    )
}
