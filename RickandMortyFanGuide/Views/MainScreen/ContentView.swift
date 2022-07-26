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
    
    var previousButton: some View {
        Button("Previous") {
            Task {
                await model.previousPage()
            }
        }
        .disabled(!model.hasPreviousPage)
    }
    
    var nextButton: some View {
        Button("Next") {
            Task {
                await model.nextPage()
            }
        }
        .disabled(!model.hasNextPage)
    }


    //MARK: - Body
    var body: some View {
        
        NavigationView {
          
            List(model.filteredCharacters){
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
            .searchable(text: $model.searchText, prompt: "Search for a character")
            .onChange(of: model.searchText, perform: { newValue in
               Task {
                       await model.fetchallCharacters()
             
                }
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                previousButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                 nextButton
                }
            }
            .navigationBarTitle("Characters")
        }//Navigationview
        .task({
            await model.fetchallCharacters()
        })
        .phoneOnlyNavigationView()
        .environmentObject(favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
