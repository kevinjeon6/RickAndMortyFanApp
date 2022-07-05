//
//  ContentView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = CharacterViewModel()
    @State private var page = 1
    
    var body: some View {
//        ForEach(model.characterData?.results ?? []) {
//            n in
//            Text(n.name ?? "")
//        }
        
        NavigationView {
            List {
                ForEach(self.model.characterData?.results ?? []) { character in
                    Text(character.name ?? "")
                    
                }
            }
            .navigationBarItems(leading:
            page > 1 ?
                Button("Previous") {
                    
                    
                    
                    page -= 1
                    model.previousPage(page: self.page)
                    
                    
            } : nil , trailing:
                                    page <= 43 ?
                                    
                                    Button("Next") {
                page += 1
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
