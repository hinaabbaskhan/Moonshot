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
            Image("Example")
                .resizable()
                   .scaledToFit()
                   .containerRelativeFrame(.horizontal) { size, axis in
                           size * 0.8
                       }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
