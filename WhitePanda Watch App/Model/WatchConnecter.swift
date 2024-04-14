//
//  Connecter.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/08.
//

import Foundation
import WatchConnectivity

final class WatchConnecter: NSObject {

    static let shared: WatchConnecter = .init()

    private var isGmaeStartedContinuation: AsyncStream<Bool>.Continuation?
    var isGmaeStartedStream: AsyncStream<Bool> {
        AsyncStream { continuation in
            self.isGmaeStartedContinuation = continuation
        }
    }

    override init() {
        super.init()

        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
}

extension WatchConnecter: WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("session: \(session)")

        if let error {
            print("error: \(error.localizedDescription)")
        }
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("========Message")
        print(message)
        if let isGmaeStarted = message["isGameStarted"] as? Bool {
            isGmaeStartedContinuation?.yield(isGmaeStarted)
            replyHandler(["GameStarted": true])
        }
    }
}
