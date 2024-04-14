//
//  PastResultFeature.swift
//  WhitePanda
//
//  Created by Satoshi Komatsu on 2024/04/14.
//

import Foundation
import ComposableArchitecture
import Model

@Reducer
struct PastResultsReducer {

    @ObservableState
    struct State: Equatable {
    }

    enum Action {
        case hoge
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .hoge:
                return .none
            }
        }
    }
}
