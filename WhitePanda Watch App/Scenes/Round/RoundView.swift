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
        ScrollView {
            VStack {
                Text("Hole: \(store.roundCount)")
                    .font(.title3)
                    .fontWeight(.regular)

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
                        if store.roundCount > 1 {
                            Button(action: {
                                store.send(.goPreviousButtonTapped)
                            }, label: {
                                Text("Back")
                            })
                        }

                        if store.round.type.rawValue != store.roundCount {
//                            Button(action: {
//                                store.send(.goNextButtonTapped)
//                            }, label: {
//                                Text("Finish")
//                            })
//                        } else {
                            Button(action: {
                                store.send(.goNextButtonTapped)
                            }, label: {
                                Text("Next")
                            })
                        }
                    }

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
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RoundView(store: .init(initialState: RoundFeature.State(round: .init(type: .full)), reducer: {
        RoundFeature(connecter: WatchConnecter.shared)
    }))
}
