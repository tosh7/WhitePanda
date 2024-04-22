//
//  File.swift
//  
//
//  Created by Satoshi Komatsu on 2024/04/13.
//

import Foundation

public final class RoundModel: NSObject {
    public let type: RoundType
    public var counts: [CountModel] = []
    public var totalScore: Int {
        return counts.reduce(0) {
            $0 + $1.count
        }
    }

    public init(type: RoundType) {
        self.type = type
    }
}

// FIXME: This cound be replaced with Int, but use struct just for further updates
public struct CountModel: Equatable, Identifiable {
    public var id: UUID = UUID()
    var count: Int
//    var per: Int

    public init(count: Int) {
        self.count = count
    }
}
