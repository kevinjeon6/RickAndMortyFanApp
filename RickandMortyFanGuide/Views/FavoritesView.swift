//
//  FavoritesView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/27/22.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var model: CharacterViewModel
    @EnvironmentObject var favorites: Favorites
    //Creating the property of the same type (Favorites) can acceass the data and get updated when the data changes
  
    var body: some View {
        
       
        NavigationView {
            List(model.filteredCharacters) { character in
                if favorites.contains(character) {

                    NavigationLink {
                        CharacterDetailsView(character: character)
                    } label: {
                        HStack {
                            CharacterRowView(imageUrlString: character.image, name: character.name, species: character.species)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        FavoritesView()
//            .environmentObject(Favorites())
//    }
//}
