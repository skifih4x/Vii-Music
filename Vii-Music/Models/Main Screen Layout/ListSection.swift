//
//  ListSection.swift
//  Vii-Music
//
//  Created by Alexander Altman on 19.01.2023.
//

import Foundation

enum ListSection {
    case first([ListItem])
    case second([ListItem])
    
    // Define sections
    var items: [ListItem] {
        switch self {
        case .first(let items), .second(let items):
            return items
        }
    }
    
    // Numbers of items in section
    var count: Int {
        items.count
    }
    
    // Sections headers
    var title: String {
        switch self {
        case .first(_):
            return "First header"
        case .second(_):
            return "Second header"
        }
    }
}
