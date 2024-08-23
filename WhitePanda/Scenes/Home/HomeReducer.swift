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
        @Presents var pastResultsState: PastResultsReducer.State?
        @Presents var resultState: ResultReducer.State?
    }

    enum Action {
        case createNewRound
        case seePastRound
        case successConnection
        case failureConnection
        case establishingConnection
        // For transion
        case alert(PresentationAction<Alert>)
        case goPastResults(PresentationAction<PastResultsReducer.Action>)
        case goResult(PresentationAction<ResultReducer.Action>)

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
                state.pastResultsState = PastResultsReducer.State()
                return .none
            case .successConnection:
                print("successConnection")
                state.isLoading = false
                state.resultState = ResultReducer.State()
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
            case .goPastResults:
                return .none
            case .goResult:
                return .none
            case .alert:
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
        .ifLet(\.$pastResultsState, action: \.goPastResults) {
            PastResultsReducer()
        }
        .ifLet(\.$resultState, action: \.goResult) {
            ResultReducer(connecter: connecter)
        }
    }
}
