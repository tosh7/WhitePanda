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
        var isLoading: Bool = false
    }

    enum Action {
        case createNewRound
        case seePastRound
        case successConnection
        case failureConnection
        case establishingConnection
    }

    var connecter: iPhoneConnecter

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .createNewRound:
                return .run { send in
                    await send(.establishingConnection)
                    do {
                        try await _ = connecter.gameOn()
                        await send(.successConnection)
                    } catch let error {
                        print(error)
                        await send(.failureConnection)
                    }
                }
            case .seePastRound:
                return .none
            case .successConnection:
                print("successConnection")
                state.isLoading = false
                return .none
            case .failureConnection:
                print("failureConnection")
                state.isLoading = false
                return .none
            case .establishingConnection:
                print("establishingConnection")
                state.isLoading = true
                return .none
            }
        }
    }
}
