//
//  Song.swift
//  YT-Vabor
//
//  Created by Justin Seal on 5/13/25.
//

import Foundation

struct Song: Codable, Identifiable {
    let id: UUID?
    var title: String
}
