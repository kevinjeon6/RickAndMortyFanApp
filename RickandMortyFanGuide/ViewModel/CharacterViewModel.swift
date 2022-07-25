//
//  CharacterViewModel.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//


import Foundation

@MainActor
class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    //Don't need an init() method as all properties of this class has default values
    //Using concurrency features
    
    @Published var searchText = ""
    
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
    private(set) var maxPages = 1
    private(set) var currentPage = 1
    
    private(set) var hasPreviousPage: Bool = false
    private(set) var hasNextPage: Bool = true
    
    
    struct CharacterResults: Codable {
        var info: Info
        var results: [Character]
        
        struct Info: Codable {
            var pages: Int
            var next: URL?
            var prev: URL?
        }
    }
    



    //MARK: - Fetch all Characters
    
    
    func fetchallCharacters() async {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(currentPage)&name=\(searchText.trimmed())") else {
            fatalError("Bad URL")
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedCharacters = try JSONDecoder().decode(CharacterResults.self, from: data)
            maxPages = decodedCharacters.info.pages
            hasPreviousPage = decodedCharacters.info.prev != nil
            hasNextPage = decodedCharacters.info.next != nil
            
            characters = decodedCharacters.results
        } catch {
             characters = []
        }
    }
    

    
    
    //MARK: - Next page
    func nextPage() async {
      //Update current page and fetch JSON
        currentPage += 1
        await fetchallCharacters()
    }
    
    
    //MARK: - Previous page
    func previousPage() async {
       //Update current page and fetch JSON
        currentPage -= 1
        await fetchallCharacters()
    }
    
    
    
    
    
}

