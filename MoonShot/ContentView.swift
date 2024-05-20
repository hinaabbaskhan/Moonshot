//
//  ContentView.swift
//  MoonShot
//
//  Created by Hina Khan on 28/04/2024.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true

    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button(action: {
                       showingGrid.toggle()
                   }) {
                       Image(systemName: showingGrid ? "list.bullet" : "square.grid.2x2")
                   }
               }
           }
        }
    }
}


struct GridLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate )
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                                
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                            .frame(maxWidth: .infinity)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
            
        }
    }
    
    
}

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
            List(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission,astronauts: astronauts)
                }label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate )
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                            
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                        .frame(maxWidth: .infinity)
                        
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
            .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}
