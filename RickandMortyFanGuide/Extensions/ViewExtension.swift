//
//  ViewExtension.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/18/22.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
