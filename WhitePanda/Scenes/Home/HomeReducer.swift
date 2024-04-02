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
    }

    enum Action {
        case createNewRound
        case seePastRound
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .createNewRound:
                return .none
            case .seePastRound:
                return .none
            }
        }
    }
}
