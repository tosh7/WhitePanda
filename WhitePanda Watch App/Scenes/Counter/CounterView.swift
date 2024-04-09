//
//  CounterView.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/01.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {

    @Bindable var store: StoreOf<Counter>

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
            }
        }

    }
}

#Preview {
    CounterView(
        store: Store(initialState: Counter.State()) {
            Counter()
        })
}
