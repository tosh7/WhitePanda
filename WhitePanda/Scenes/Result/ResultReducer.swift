//
//  ResultsReducer.swift
//  WhitePanda
//
//  Created by Satoshi Komatsu on 2024/04/14.
//

import Foundation
import ComposableArchitecture
import Model

@Reducer
struct ResultReducer {

    @ObservableState
    struct State: Equatable {
        @Presents var data: [Int: Int]?
    }

    enum Action {
        case recivedData(data: [Int: Int])
        case onAppear
    }

    var connecter: iPhoneConnecter

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .recivedData(let data):
                state.data = data
                return .none
            case .onAppear:
                return .run { send in
                    for await data in self.connecter.roundDataStream {
                        print("===data")
                        print(data)
                        await send(.recivedData(data: data))
                    }
                }
            }
        }
    }
}
