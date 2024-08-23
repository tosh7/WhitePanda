//
//  ResultListView.swift
//  WhitePanda
//
//  Created by Satoshi Komatsu on 2024/08/23.
//

import SwiftUI

struct ResultListView: View {

    struct ScoreData: Identifiable {
        var id = UUID()
        var hole: Int
        var score: Int
    }

    var list: [ScoreData]

    init(result: [Int: Int]?) {
        guard let result else {
            self.list = []
            return
        }

        self.list = Array(1...18).map {
            ScoreData(hole: $0, score: result[$0] ?? 0)
        }
    }

    var body: some View {
        List(list) { item in
            Text("Hole \(item.hole): \(item.score)")
        }
    }
}

#Preview {
    ResultListView(result: [
        1: 3,
        2: 4,
        3: 4,
        4: 5,
        5: 6
    ])
}
