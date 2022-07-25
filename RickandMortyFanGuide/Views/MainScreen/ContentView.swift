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
//    @State private var searchText = ""
//     var filterResults = CharacterViewModel()

    
    
    //MARK: - Filter List
//    var filteredCharacters: [Character] {
//        if searchText.isEmpty {
//            return model.characters
//        } else {
//            return model.characters.filter {
//                $0.name.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }

    

    
    
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
             
                   
                }         })
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Previous") {
                        Task {
                            await model.previousPage()
                            
                        }
                    }
                    .disabled(!model.hasPreviousPage)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Next") {
                        Task {
                            await model.nextPage()
                        }
                    }
                    .disabled(!model.hasNextPage)
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
