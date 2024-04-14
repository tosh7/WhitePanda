//
//  PastResultView.swift
//  WhitePanda
//
//  Created by Satoshi Komatsu on 2024/04/14.
//

import SwiftUI
import ComposableArchitecture

struct PastResultView: View {

    @Bindable var store: StoreOf<PastResultsReducer>

    var body: some View {
        Text("Sorry it's not available, please wait for update!")
    }
}

#Preview {
    PastResultView(
        store: Store(initialState: PastResultsReducer.State()) {
            PastResultsReducer()
        }
    )
}
