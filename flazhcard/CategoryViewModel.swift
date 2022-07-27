//
//  CategoryViewModel.swift
//  flazhcard
//
//  Created by vica valencia on 27/07/22.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var cards: [Card] = []
    
    @Published var categoryNames: [String] = []
    
    
}
