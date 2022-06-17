//
//  CharacterViewModel.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characterData: Character?
    
    init() {
        getCharacterData()
    }
    
    
    func getCharacterData(){
        
        //Create url String
        let characterURL = "https://rickandmortyapi.com/api/character"
        
        //Create a URL Object
        //Make sure that url is true else false
        guard let url = URL(string: characterURL) else {
            print("Bad URL: \(characterURL)")
            return
        }
        
        //Create a URL Request
        let request = URLRequest(url: url)
        
        //Create a URL session
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            //Make sure that error is true else return false
            guard error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Character.self, from: data!)
                
                DispatchQueue.main.async {
                    self.characterData = result
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    
    }//func getCharacter
}
