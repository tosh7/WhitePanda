//
//  InitialView.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/08.
//

import SwiftUI

struct InitialView: View {

    @State var viewModel = InitialViewModel()

    var body: some View {
        VStack {
            Text("To start a new round,\n open your iPhone and set up!")
                .multilineTextAlignment(.center)

            Button(action: {
                viewModel.createFreeButtonTapped()
            }, label: {
                Text("Or free count mode")
            })
        }
        .navigationDestination(isPresented: $viewModel.showCounter) {
            CounterView()
        }
        .navigationDestination(isPresented: $viewModel.showRound) {
            RoundView()
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    NavigationStack {
        InitialView()
    }
}
