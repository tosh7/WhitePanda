//
//  ResultView.swift
//  WhitePanda
//
//  Created by Satoshi Komatsu on 2024/04/14.
//

import SwiftUI

struct ResultView: View {

    @State var viewModel = ResultViewModel()

    var body: some View {
        ResultListView(result: viewModel.data)
            .task {
                await viewModel.startListening()
            }
    }
}

#Preview {
    ResultView()
}
