//
//  CounterViewModel.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/01.
//

import Foundation
import Observation

@Observable
final class CounterViewModel {
    var count = 0

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
}
