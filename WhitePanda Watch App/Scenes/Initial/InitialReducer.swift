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
        @Presents var counterState: Counter.State?
    }

    enum Action {
        case createFreeButtonTapped
        case createFree(PresentationAction<Counter.Action>)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .createFreeButtonTapped:
                state.counterState = Counter.State()
                return .none
            case .createFree:
                return .none
            }
        }
    }
}
