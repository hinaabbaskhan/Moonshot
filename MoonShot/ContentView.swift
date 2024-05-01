//
//  ContentView.swift
//  MoonShot
//
//  Created by Hina Khan on 28/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0..<100) {
                        Text("Item \($0)")
                            .font(.title)
                    }
                }
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
