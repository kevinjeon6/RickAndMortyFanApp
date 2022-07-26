//
//  CharacterDetailsView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/8/22.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    //Need to reference for detail view by relying on the list to assign the details. 
 var character: Character
    
    @EnvironmentObject var favorites: Favorites
   
    
    @State private var isFavorited = false
  
    
    
    var favoriteText: String {
        if isFavorited  {
            return "Favorited"
        } else {
            return "Favorite"
        }
    }
    
    var favoriteButton: some View {
        Button {
            isFavorited.toggle()
           
            
            if favorites.contains(character) {
                //If favorites contains a character, we are trying to un-favorite and remove it
                favorites.remove(character)
            } else {
                favorites.add(character)
            }
           
        } label: {
            ZStack {
                if isFavorited == false {
                    Capsule()
                        .strokeBorder(Color.green, lineWidth: 4)
                        .frame(width: 250, height: 50)
                        .background(
                            Capsule()
                                .fill(.green)
                                .cornerRadius(20)
                        )
                
                } else {
                    Capsule()
                        .strokeBorder(Color.blue, lineWidth: 4)
                        .frame(width: 250, height: 50)
                        .background(
                        Capsule()
                            .fill(.blue)
                            .cornerRadius(20)
                        )
                        
                }
                
                HStack {
                    Text(favoriteText)
                        .foregroundColor(.white)
                    Image(systemName: favorites.contains(character) ? "heart.fill" : "heart")
                        .foregroundColor(favorites.contains(character) ? .white : .white)
                        
                }
            }
        }
        .padding(.vertical)
    }
 
    
    var body: some View {
        ScrollView {
            VStack {
                //MARK: - Image
                AsyncImage(url: URL(string: character.image)) {
                    phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("Couldn't upload photo")
                    } else {
                        ProgressView()
                    }
                }
            

                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading)
                       
                    
                    Section {
                        SubDetailView(sfImageString: "checkmark.circle", infoText: "Status", detailText: character.status)
                        
                        SubDetailView(sfImageString: "person.circle", infoText: "Species", detailText: character.species)
                       
                        SubDetailView(sfImageString: "house.circle", infoText: "Origin", detailText: character.origin.name)
                        
                        SubDetailView(sfImageString: "mappin.circle", infoText: "Location", detailText: character.location.name)
                    }
                    .padding(.horizontal)

                }
                
           
            favoriteButton
             
               

                
            }
        }
       
    }
    
    
  
}

struct CharacterDetailsView_Previews: PreviewProvider {

    static var previews: some View {
        let model = CharacterViewModel()
        CharacterDetailsView(character: (model.characters[0]))
            .environmentObject(Favorites())
          
    }
}


