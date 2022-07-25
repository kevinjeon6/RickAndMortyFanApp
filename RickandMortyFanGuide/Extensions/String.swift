//
//  String.swift
//  RickandMortyFanGuide
//
//  Created by Kevin Mattocks on 7/25/22.
//

import Foundation

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
