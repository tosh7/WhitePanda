//
//  CounterReducer.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/01.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Counter {

    @ObservableState
    struct State: Equatable {
        var count = 0
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case resetButtonTapped
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                if state.count > 0 {
                    state.count -= 1
                }
                return .none
            case .incrementButtonTapped:
                state.count += 1
                return .none
            case .resetButtonTapped:
                state.count = 0
                return .none
            }
        }
    }
}
