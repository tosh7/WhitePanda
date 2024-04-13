//
//  RoundReducer.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/13.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RoundFeature {

    @ObservableState
    struct State: Equatable {
        var count: Int = 0
        var roundCount: Int = 1
        var type: RoundType
    }

    enum Action {
        // ViewEvents
        case decrementButtonTapped
        case incrementButtonTapped
        case resetButtonTapped
        case goNextButtonTapped
        case goPreviousButtonTapped
        // transitions
        case resultScene
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
            case .goNextButtonTapped:
                state.roundCount += 1
                return .none
            case .goPreviousButtonTapped:
                state.roundCount -= 1
                return .none
            case .resultScene:
                return .none
            }
        }
    }
}


enum RoundType: Int {
    case half = 9
    case full = 18
}
