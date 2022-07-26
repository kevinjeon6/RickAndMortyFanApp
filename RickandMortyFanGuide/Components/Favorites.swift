//
//  Favorites.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/19/22.
//

import Foundation

class Favorites: ObservableObject {
    private var characters: Set<String>

    private let saveKey = "SaveFavorites"
    
    init(){
        //load saved data
        if let data = UserDefaults.standard.data(forKey: saveKey) {

            
            //Using Set<String> because we don't want to store the entire struct, just the id
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                characters = decoded
                return
            }
        }
        characters = []
    }
    
    
    func contains(_ character: Character) -> Bool {
        characters.contains(String(character.id))
    }
    
    func add(_ character: Character) {
        objectWillChange.send()
        characters.insert(String(character.id))
        save()
    }
    
    func remove(_ character: Character) {
        objectWillChange.send()
        characters.remove(String(character.id))
        save()
    }
    
    
    func save(){
        if let encoded = try? JSONEncoder().encode(characters) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
