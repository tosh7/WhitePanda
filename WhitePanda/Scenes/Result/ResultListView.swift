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
            HStack {
                Text("Hole \(item.hole)")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.leading, 20)
                Spacer()
                Text("\(item.score)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(item.score <= 5 ? .green : .red)
                    .padding(.trailing, 20)
            }
            .padding(.vertical, 10)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Results")
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
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
