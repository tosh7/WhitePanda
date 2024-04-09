//
//  HomeReducer.swift
//  WhitePanda
//
//  Created by satoshi on 2024/04/01.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Home {

    @ObservableState
    struct State: Equatable {
        var connecter: iPhoneConnecter
    }

    enum Action {
        case createNewRound
        case seePastRound
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .createNewRound:
                state.connecter.gameOn()
                return .none
            case .seePastRound:
                return .none
            }
        }
    }
}
