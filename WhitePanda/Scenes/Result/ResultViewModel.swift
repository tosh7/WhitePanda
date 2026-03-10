//
//  ResultViewModel.swift
//  WhitePanda
//
//  Created by Satoshi Komatsu on 2024/04/14.
//

import Foundation
import Observation

@Observable
final class ResultViewModel {
    var data: [Int: Int]?
    private let connecter: iPhoneConnecter

    init(connecter: iPhoneConnecter = .shared) {
        self.connecter = connecter
    }

    func startListening() async {
        for await data in connecter.roundDataStream {
            print("===data")
            print(data)
            self.data = data
        }
    }
}
