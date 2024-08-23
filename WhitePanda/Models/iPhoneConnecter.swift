//
//  Connecter.swift
//  WhitePanda
//
//  Created by satoshi on 2024/04/09.
//

import Foundation
import WatchConnectivity
import Model

final class iPhoneConnecter: NSObject {

    static let shared: iPhoneConnecter = .init()
    private var session: WCSession!

    private var roundDataContinuation: AsyncStream<[Int: Int]>.Continuation?
    var roundDataStream: AsyncStream<[Int: Int]> {
        AsyncStream { continuation in
            self.roundDataContinuation = continuation
        }
    }

    override init() {
        super.init()

        if WCSession.isSupported() {
            self.session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
}

extension iPhoneConnecter: WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
            print("session: \(session)")

            if let error {
                print("error: \(error.localizedDescription)")
            }
        }
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("========iPhone Message")
        print(message)
        if let roundModel = message["round"] as? [Int: Int] {
            roundDataContinuation?.yield(roundModel)
        }
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
    }

    func sessionDidDeactivate(_ session: WCSession) {
    }
}

extension iPhoneConnecter {
    func gameOn() async throws -> [String: Any] {
        let context: [String: Any] = ["isGameStarted": true]
        return try await session.sendMessageWithValidation(message: context)
    }
}
