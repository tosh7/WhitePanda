//
//  ResultView.swift
//  WhitePanda
//
//  Created by Satoshi Komatsu on 2024/04/14.
//

import SwiftUI
import ComposableArchitecture

struct ResultView: View {

    @Bindable var store: StoreOf<ResultReducer>

    var body: some View {
        Text("You can see the result \( store.data?[1])")
            .onAppear {
                store.send(.onAppear)
            }
    }
}

#Preview {
    ResultView(
        store: Store(initialState: ResultReducer.State()) {
            ResultReducer(connecter: iPhoneConnecter.shared)
        }
    )
}
