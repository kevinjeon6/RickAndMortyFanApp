//
//  CharactersTabView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/27/22.
//

import SwiftUI

struct CharactersTabView: View {
   


    var body: some View {
        TabView {
            
            //MARK: - Character Tab
            CharacterView()
                .tabItem {
                    Label("Characters", systemImage: "person.3.fill")
                }
            
            
            //MARK: - Favorites Tab
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
                
        }//TabView
       
              
    }
}

struct CharactersTabView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersTabView()
    }
}
