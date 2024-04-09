//
//  Connecter.swift
//  WhitePanda
//
//  Created by satoshi on 2024/04/09.
//

import Foundation
import WatchConnectivity

final class iPhoneConnecter: NSObject {

    static let shared: iPhoneConnecter = .init()
    private var session: WCSession!

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

    func sessionDidBecomeInactive(_ session: WCSession) {
    }

    func sessionDidDeactivate(_ session: WCSession) {
    }
}

extension iPhoneConnecter {
    func gameOn() {
        let context: [String: Any] = ["isGameStarted": true]
        session.sendMessage(context, replyHandler: { _ in })
    }
}
