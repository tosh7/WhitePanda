//
//  WhitePandaApp.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/01.
//

import SwiftUI
import ComposableArchitecture

@main
struct WhitePanda_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            InitialView(
                store: Store(initialState: InitialFeature.State(watchConnecter: Connecter.shared)) {
                    InitialFeature()
                }
            )
        }
    }
}
