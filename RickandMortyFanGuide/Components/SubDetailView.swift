//
//  SubDetailView.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/19/22.
//

import SwiftUI

struct SubDetailView: View {
    
    var sfImageString: String
    var infoText: String
    var detailText: String?
    
    var body: some View {
        HStack {
            Image(systemName: sfImageString)
                .font(.title)
            Text(infoText)
            Spacer()
            Text(detailText ?? "")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 5)
    }
}
