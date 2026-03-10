//
//  HomeView.swift
//  WhitePanda
//
//  Created by satoshi on 2024/04/01.
//

import SwiftUI

struct HomeView: View {

    @State var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Text("Welcome to Golf Counter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)

                Button("Create New Round") {
                    Task {
                        await viewModel.createNewRound()
                    }
                }
                .buttonStyle(FilledButtonStyle())
                .padding(.horizontal, 20)

                Button("See Past Results") {
                    viewModel.seePastResults()
                }
                .buttonStyle(FilledButtonStyle())
                .padding(.horizontal, 20)
            }

            if viewModel.isLoading {
                BlurView(style: .dark)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding()
                        .tint(Color.white)
                        .scaleEffect(1.2)

                    Text("Hold On!\nConnecting to your Apple Watch")
                        .foregroundColor(.pink)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(10)
                }
            }
        }
        .alert("Error", isPresented: $viewModel.showAlert) {
            Button("Close", role: .cancel) {}
        } message: {
            Text(viewModel.alertMessage)
        }
        .navigationDestination(isPresented: $viewModel.showPastResults) {
            PastResultView()
        }
        .navigationDestination(isPresented: $viewModel.showResult) {
            ResultView()
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
