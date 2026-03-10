//
//  RoundViewModel.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/13.
//

import Foundation
import Observation
import Model

@Observable
final class RoundViewModel {
    var count: Int = 0
    var roundCount: Int = 1
    var round: Model.RoundModel = .init(type: .full)

    private let connecter: WatchConnecter

    init(connecter: WatchConnecter = .shared) {
        self.connecter = connecter
    }

    func increment() {
        count += 1
    }

    func decrement() {
        if count > 0 {
            count -= 1
        }
    }

    func reset() {
        count = 0
    }

    func goNext() {
        round.counts[roundCount] = count
        connecter.sendScore(context: ["round": round.counts])
        roundCount += 1
        count = round.counts[roundCount] ?? 0
    }

    func finish() {
        round.counts[roundCount] = count
        connecter.sendScore(context: ["round": round.counts])
    }

    func goPrevious() {
        roundCount -= 1
        count = round.counts[roundCount] ?? 0
    }
}
