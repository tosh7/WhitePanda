//
//  RoundView.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/13.
//

import SwiftUI

struct RoundView: View {
    @State var viewModel = RoundViewModel()

    var body: some View {
        ScrollView {
            VStack {
                Text("Hole: \(viewModel.roundCount)")
                    .font(.title3)
                    .fontWeight(.regular)

                Text("\(viewModel.count)")
                    .font(.title)
                    .fontWeight(.semibold)

                Spacer()

                VStack {
                    Button(action: {
                        viewModel.increment()
                    }, label: {
                        Text("+")
                            .font(.title2)
                    })

                    HStack {
                        if viewModel.roundCount > 1 {
                            Button(action: {
                                viewModel.goPrevious()
                            }, label: {
                                Text("Back")
                            })
                        }

                        if viewModel.round.type.rawValue == viewModel.roundCount {
                            Button(action: {
                                viewModel.finish()
                            }, label: {
                                Text("Finish")
                            })
                        } else {
                            Button(action: {
                                viewModel.goNext()
                            }, label: {
                                Text("Next")
                            })
                        }
                    }

                    HStack {
                        Button(action: {
                            viewModel.decrement()
                        }, label: {
                            Text("-")
                                .font(.title3)
                        })

                        Button(action: {
                            viewModel.reset()
                        }, label: {
                            Text("Reset")
                        })
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RoundView()
}
