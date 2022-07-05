//
//  Character.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import Foundation
import SwiftUI




struct Character: Codable {
    
    var info: Info
    var results: [CharacterResults]
}


struct Info: Codable {
    var count: Int
    var pages: Int
    var next: String?
    let prev: String?
}

struct CharacterResults: Codable, Identifiable {
    
    let id = UUID()
    var name: String?
    var status: String?
    var species: String?
    var origin: Origin?
    var location: Location?
    var image: String?

}

struct Origin: Codable {
    var name: String
}

struct Location: Codable {
    var name: String
}
