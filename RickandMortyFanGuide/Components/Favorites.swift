//
//  Favorites.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/19/22.
//

import Foundation

class Favorites: ObservableObject {
    private var characters: Set<String>
    
    private let saveKey = "Favorites"
    
    init(){
        //load saved data
        
        characters = []
    }
    
    
    func contains(_ character: CharacterResults) -> Bool {
        characters.contains(String(character.id))
    }
    
    func add(_ character: CharacterResults) {
        objectWillChange.send()
        characters.insert(String(character.id))
        save()
    }
    
    func remove(_ character: CharacterResults) {
        objectWillChange.send()
        characters.remove(String(character.id))
        save()
    }
    
    
    func save(){
        
    }
}
