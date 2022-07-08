//
//  CharacterRowView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/7/22.
//

import SwiftUI

struct CharacterRowView: View {

    var imageUrlString: String?
    var name: String?
    var species: String?
    
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrlString ?? "")){ phase in
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
           
            VStack(alignment: .leading) {
                Text(name ?? "")
                    .font(.title2)
                    .bold()
                Text(species ?? "")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
              
        }
    }
}


