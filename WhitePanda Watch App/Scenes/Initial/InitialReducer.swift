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
        @Presents var counterState: Counter.State?
    }

    enum Action {
        case createFreeButtonTapped
        case createFree(PresentationAction<Counter.Action>)
        case recivedGameStart
        case roundStart(PresentationAction<Counter.Action>)
        case onAppear
    }

    var watchConnecter: WatchConnecter

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .createFreeButtonTapped:
                state.counterState = Counter.State()
                return .none
            case .createFree:
                return .none
            case .recivedGameStart:
                state.counterState = Counter.State()
                return .none
            case .roundStart:
                return .none
            case .onAppear:
                return .run { send in
                    for await _ in self.watchConnecter.isGmaeStartedStream {
                        await send(.recivedGameStart)
                    }
                }
            }
        }
        .ifLet(\.$counterState, action: \.createFree) {
            Counter()
        }
        .ifLet(\.$counterState, action: \.roundStart) {
            Counter()
        }
    }
}
