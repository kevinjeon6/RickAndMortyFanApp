//
//  ContentView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = CharacterViewModel()
    @StateObject var favorites = Favorites()
    @State private var page = 1
    
    var body: some View {

        
        NavigationView {
          
                List(model.characterData?.results ?? []){
                   character in
                        
                        NavigationLink {
                            CharacterDetailsView(character: character)
                        } label: {
                            HStack{
                                CharacterRowView(imageUrlString: character.image, name: character.name, species: character.species)
                                
                                if favorites.contains(character) {
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .accessibilityLabel("This is a favorite character")
                                        .foregroundColor(.red)
                                }
                            }
                        
                        }
                }
                .navigationTitle("Characters")
                .navigationBarItems(leading:
                self.page > 1 ?
                    Button("Previous") {
                    self.page -= 1
                        model.previousPage(page: self.page)
                } : nil,
                trailing:
                self.page <= 43 ?
                Button("Next") {
                    self.page += 1
                    model.nextPage(page: self.page)
                } : nil )
        }
        .phoneOnlyNavigationView()
        .environmentObject(favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
