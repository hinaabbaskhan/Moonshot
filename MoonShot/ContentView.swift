//
//  ContentView.swift
//  MoonShot
//
//  Created by Hina Khan on 28/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
                    Text("Tap Me")
                        .navigationTitle("SwiftUI")
                }
    }
}

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

#Preview {
    ContentView()
}
