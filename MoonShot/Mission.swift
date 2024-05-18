//
//  Mission.swift
//  MoonShot
//
//  Created by Hina Khan on 18/05/2024.
//

import Foundation

struct CrewRole: Codable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
