//
//  CounterView.swift
//  WhitePanda Watch App
//
//  Created by satoshi on 2024/04/01.
//

import SwiftUI

struct CounterView: View {

    @State var viewModel = CounterViewModel()

    var body: some View {
        VStack {
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
}

#Preview {
    CounterView()
}
