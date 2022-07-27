//
//  Category.swift
//  flazhcard
//
//  Created by vica valencia on 27/07/22.
//

import Foundation

struct Category {
    let id: UUID
    let categoryName: String
    var cards: [Card] = [Card]()
}

struct Card {
    let id: UUID
    let categoryId: String
    let title: String
    let description: String
}
