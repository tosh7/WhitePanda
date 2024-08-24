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
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text("Welcome to Golf Counter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)

                Button("Create New Round") {
                    store.send(.createNewRound)
                }
                .buttonStyle(FilledButtonStyle())
                .padding(.horizontal, 20)

                Button("See Past Results") {
                    store.send(.seePastRound)
                }
                .buttonStyle(FilledButtonStyle())
                .padding(.horizontal, 20)
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
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                }
            }
        }
        .alert($store.scope(state: \.alert, action: \.alert))
        .navigationDestination(
            item: $store.scope(state: \.pastResultsState, action: \.goPastResults),
            destination: { store in
                PastResultView(store: store)
            })
        .navigationDestination(
            item: $store.scope(state: \.resultState, action: \.goResult),
            destination: { store in
                ResultView(store: store)
            })
    }
}

#Preview {
    HomeView(
        store: Store(initialState: Home.State()) {
            Home(connecter: iPhoneConnecter.shared)
        }
    )
}
