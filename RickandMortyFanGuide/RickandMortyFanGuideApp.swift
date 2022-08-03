//
//  RickandMortyFanGuideApp.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 6/17/22.
//

import SwiftUI

@main
struct RickandMortyFanGuideApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersTabView()
                .environmentObject(CharacterViewModel())
                .environmentObject(Favorites())
            
        }
    }
}
