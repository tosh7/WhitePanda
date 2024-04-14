//
//  File.swift
//  
//
//  Created by Satoshi Komatsu on 2024/04/14.
//

import Foundation
import WatchConnectivity

@available(iOS 13, watchOS 6, *)
extension WCSession {
    public func sendMessage(message: [String: Any]) async -> [String: Any] {
        await withCheckedContinuation { continuation in
            self.sendMessage(message, replyHandler: continuation.resume(returning:))
        }
    }

    public func sendMessageWithValidation(message: [String: Any]) async throws -> [String: Any] {
        try await withCheckedThrowingContinuation { continuation in
            self.sendMessage(message, replyHandler: continuation.resume(returning:), errorHandler: continuation.resume(throwing:))
        }
    }
}
