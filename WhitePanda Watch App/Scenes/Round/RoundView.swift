//
//  RoundView.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/13.
//

import SwiftUI
import ComposableArchitecture

struct RoundView: View {
    @Bindable var store: StoreOf<RoundFeature>

    var body: some View {
        VStack {
            Text("\(store.count)")
                .font(.title)
                .fontWeight(.semibold)

            Spacer()

            VStack {
                Button(action: {
                    store.send(.incrementButtonTapped)
                }, label: {
                    Text("+")
                        .font(.title2)
                })

                HStack {
                    Button(action: {
                        store.send(.decrementButtonTapped)
                    }, label: {
                        Text("-")
                            .font(.title3)
                    })

                    Button(action: {
                        store.send(.resetButtonTapped)
                    }, label: {
                        Text("Reset")
                    })
                }

                HStack {
                    if store.roundCount > 1 {
                        Button(action: {
                            store.send(.goPreviousButtonTapped)
                        }, label: {
                            Text("Back")
                        })
                    }

                    Button(action: {
                        store.send(.goNextButtonTapped)
                    }, label: {
                        Text(store.round.type.rawValue == store.roundCount ? "Finish" : "Next")
                    })
                }
            }
        }

    }
}

#Preview {
    RoundView(store: .init(initialState: RoundFeature.State(round: .init(type: .full)), reducer: {
        RoundFeature(connecter: WatchConnecter.shared)
    }))
}
