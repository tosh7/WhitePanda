//
//  WhitePandaApp.swift
//  WhitePanda
//
//  Created by satoshi on 2024/04/01.
//

import SwiftUI
import ComposableArchitecture

@main
struct WhitePandaApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(
                store: Store(initialState: Home.State()) {
                    Home(connecter: iPhoneConnecter.shared)
                }
            )
        }
    }
}
