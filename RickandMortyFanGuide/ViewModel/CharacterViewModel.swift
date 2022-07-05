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
//        getCharacterData()
        fetchallCharacters(page: 1) { [weak self] char in
           // DispatchQueue.main.async {
                self?.characterData = char
            //}
        }
    }
    

    
    //MARK: - Character Data
//    func getCharacterData(){
//
//        //Create url String
//        let characterURL = "https://rickandmortyapi.com/api/character"
//
//        //Create a URL Object
//        //Make sure that url is true else false
//        guard let url = URL(string: characterURL) else {
//            print("Bad URL: \(characterURL)")
//            return
//        }
//
//        //Create a URL Request
//        let request = URLRequest(url: url)
//
//        //Create a URL session
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request) { data, response, error in
//            //Make sure that error is true else return false
//            guard error == nil else {
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let result = try decoder.decode(Character.self, from: data!)
//
//                DispatchQueue.main.async {
//                    self.characterData = result
//                }
//            } catch {
//                print(error)
//            }
//        }
//        dataTask.resume()
//
//    }//func getCharacter


    //
    func fetchallCharacters(page: Int, completion: @escaping ((Character) -> ())) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            fatalError("Bad URL")
        }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error:", error)
                return
            }
            
            
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Character.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
                
    }
    
    
    //MARK: - Next page
    func nextPage(page: Int) {
        fetchallCharacters(page: page) { [weak self ] char in
            self?.characterData = char
        }
    }
    
    
    //MARK: - Previous page
    func previousPage(page: Int) {
        fetchallCharacters(page: page) { [weak self ] char in
            self?.characterData = char
        }
    }
    
    
}

