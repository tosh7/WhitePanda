//
//  RoundModel.swift
//
//
//  Created by Satoshi Komatsu on 2024/04/13.
//

import Foundation

public struct RoundModel: Equatable {
    public let type: RoundType
    public var counts: [Int: Int] = [:]
    public var totalScore: Int {
        counts.values.reduce(0, +)
    }

    public init(type: RoundType) {
        self.type = type
    }
}

// FIXME: This could be replaced with Int, but use struct just for further updates
public struct CountModel: Equatable, Identifiable {
    public var id: UUID = UUID()
    public var count: Int

    public init(count: Int) {
        self.count = count
    }
}
