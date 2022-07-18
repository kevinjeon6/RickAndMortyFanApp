//
//  ContentView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = CharacterViewModel()
    @State private var page = 1
    
    var body: some View {

        
        NavigationView {
          
                List {
                        ForEach(self.model.characterData?.results ?? []) { character in
                            
                            NavigationLink {
                                CharacterDetailsView(character: model)
                            } label: {
                                
                                CharacterRowView(imageUrlString: character.image, name: character.name, species: character.species)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
