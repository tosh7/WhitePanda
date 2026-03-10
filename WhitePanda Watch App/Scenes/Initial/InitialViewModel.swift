//
//  InitialViewModel.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/08.
//

import Foundation
import Observation

@Observable
final class InitialViewModel {
    var showCounter = false
    var showRound = false

    private let watchConnecter: WatchConnecter

    init(watchConnecter: WatchConnecter = .shared) {
        self.watchConnecter = watchConnecter
    }

    func onAppear() {
        Task { @MainActor in
            for await _ in watchConnecter.isGameStartedStream {
                showRound = true
            }
        }
    }

    func createFreeButtonTapped() {
        showCounter = true
    }
}
