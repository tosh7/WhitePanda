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
        @Presents var alert: AlertState<Action.Alert>?
    }

    enum Action {
        case createNewRound
        case seePastRound
        case successConnection
        case failureConnection
        case establishingConnection
        case alert(PresentationAction<Alert>)

        enum Alert: Equatable {}
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
                state.alert = AlertState {
                    TextState("Connection Failed!\nMake sure WhitePanda App is opened on your Apple Watch")
                } actions: {
                    ButtonState(role: .cancel)  {
                        TextState("Close")
                      }
                }
                return .none
            case .establishingConnection:
                print("establishingConnection")
                state.isLoading = true
                return .none
            case .alert:
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}
