//
//  Character.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import Foundation
import SwiftUI


struct Character: Codable, Identifiable {
    

    
    let id: Int
    var name: String
    var status: String
    var species: String
    var origin: Origin
    var location: Location
    var image: String
    

   
}

struct Origin: Codable {
    var name: String
}

struct Location: Codable {
    var name: String
}
