//
//  HomeView.swift
//  WhitePanda
//
//  Created by satoshi on 2024/04/01.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {

    @Bindable var store: StoreOf<Home>

    var body: some View {
        ZStack {
            VStack {
                Text("Welcome to Golf Counter")

                Button("Create New Round", action: {
                    store.send(.createNewRound)
                })

                Button("See past results", action: {
                    store.send(.seePastRound)
                })
            }

            if store.isLoading {
                BlurView(style: .dark)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding()
                        .tint(Color.white)
                        .scaleEffect(1.2)

                    Text("Hold On!\nConnecting to your Apple Watch")
                        .foregroundColor(.pink)
                        .bold()
                        .multilineTextAlignment(.center)
                }
            }
        }
        .alert($store.scope(state: \.alert, action: \.alert))
        //        .sheet(item: $store.scope(state: , action: )) { _ in
        //            Nagvigation {
        //
        //            }
        //        }
    }
}

#Preview {
    HomeView(
        store: Store(initialState: Home.State()) {
            Home(connecter: iPhoneConnecter.shared)
        }
    )
}
