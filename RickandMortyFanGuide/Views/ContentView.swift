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
                            
                                HStack {
                                    AsyncImage(url: URL(string: character.image ?? "")){ phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                        } else if phase.error != nil {
                                            Text("Couldn't load image")
                                        } else {
                                            ProgressView()
                                        }
                                    }
                                    .frame(width: 100, height: 100)
                                   
                                    VStack(alignment: .trailing) {
                                        Text(character.name ?? "")
                                            .font(.title2)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
