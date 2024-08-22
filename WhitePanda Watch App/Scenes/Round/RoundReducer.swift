//
//  RoundReducer.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/13.
//

import Foundation
import ComposableArchitecture
import Model

@Reducer
struct RoundFeature {

    @ObservableState
    struct State: Equatable {
        var count: Int = 0
        var roundCount: Int = 1
        var round: Model.RoundModel = .init(type: .full)
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

    let connecter: WatchConnecter

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
                state.round.counts.append(.init(count: state.count))
                connecter.sendScore(context: ["round": state.round])
                state.count = 0
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
