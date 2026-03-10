//
//  HomeViewModel.swift
//  WhitePanda
//
//  Created by satoshi on 2024/04/01.
//

import Foundation
import Observation

@Observable
final class HomeViewModel {
    var isLoading = false
    var showAlert = false
    var alertMessage = ""
    var showResult = false
    var showPastResults = false

    private let connecter: iPhoneConnecter

    init(connecter: iPhoneConnecter = .shared) {
        self.connecter = connecter
    }

    func createNewRound() async {
        isLoading = true
        do {
            _ = try await connecter.gameOn()
            isLoading = false
            showResult = true
        } catch {
            print(error)
            isLoading = false
            alertMessage = "Connection Failed!\nMake sure WhitePanda App is opened on your Apple Watch"
            showAlert = true
        }
    }

    func seePastResults() {
        showPastResults = true
    }
}
