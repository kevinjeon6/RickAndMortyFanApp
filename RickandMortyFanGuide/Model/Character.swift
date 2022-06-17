//
//  Character.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import Foundation

struct Character: Codable {
    var results: [Results]
    
}


struct Results: Codable, Identifiable {
    let id = UUID()
    var name: String
    var status: String
    var species: String
    var origin: [Origin]
    var Location: [Location]
}

struct Origin: Codable {
    var name: String
}

struct Location: Codable {
    var name: String
}
