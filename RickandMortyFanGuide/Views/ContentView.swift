//
//  ContentView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = CharacterViewModel()
    
    var body: some View {
        ForEach(model.characterData?.results ?? []) {
            n in
            Text(n.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
