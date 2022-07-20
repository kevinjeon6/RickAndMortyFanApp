//
//  CharacterDetailsView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/8/22.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    //Need to reference for detail view by relying on the list to assign the details. 
 var character: CharacterResults
    
    
    
    @State private var isFavorited = false
  
    
    
    var favoriteText: String {
        if isFavorited  {
            return "Favorited"
        } else {
            return "Favorite"
        }
    }
 
    
    var body: some View {
        ScrollView {
            VStack {
                //MARK: - Image
                AsyncImage(url: URL(string: character.image ?? "")) {
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
                    Text(character.name ?? "")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading)
                       
                    
                    Section {
                        SubDetailView(sfImageString: "checkmark.circle", detailText: character.status)
                        
                        SubDetailView(sfImageString: "person.circle", detailText: character.species)
                       
                        SubDetailView(sfImageString: "house.circle", detailText: character.origin?.name)
                        
                        SubDetailView(sfImageString: "mappin.circle", detailText: character.location?.name)
                    }
                header: {
                        Text("Character Information")
                    }
                    .padding(.horizontal)

                   
                }
                
                Button {
                    isFavorited.toggle()
                   
                  
                } label: {
                    ZStack {
                        if isFavorited == false {
                            Capsule()
                                .strokeBorder(Color.green, lineWidth: 4)
                                .frame(width: 250, height: 50)
                                .background(
                                    Capsule()
                                        .fill(.green)                             .cornerRadius(20)
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
                            Image(systemName: isFavorited ? "heart.fill" : "heart")
                                .foregroundColor(isFavorited ? .white : .white)
                                
                        }
                    }
                }
                .padding(.vertical)
               

                
            }
        }
    }
    
    
  
}

struct CharacterDetailsView_Previews: PreviewProvider {

    static var previews: some View {
        let model = CharacterViewModel()
        CharacterDetailsView(character: (model.characterData?.results[0])!)
//            .environmentObject(Favorites())
          
    }
}
