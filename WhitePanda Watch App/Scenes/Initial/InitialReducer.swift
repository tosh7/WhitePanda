//
//  InitialReducer.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/08.
//

import Foundation
import ComposableArchitecture

@Reducer
struct InitialFeature {

    @ObservableState
    struct State: Equatable {
        var watchConnecter: Connecter
        @Presents var counterFeature: Counter.State?
    }

    enum Action {
        case createFree
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .createFree:
                state.counterFeature = Counter.State()
                return .none
            }
        }
    }
}
