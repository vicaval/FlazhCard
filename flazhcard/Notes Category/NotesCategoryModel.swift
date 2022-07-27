//
//  NotesCategoryModel.swift
//  flazhcard
//
//  Created by vica valencia on 27/07/22.
//

import Foundation
import RealmSwift

struct NotesCategoryModel {
    
    var id = UUID()
    var categoryName: String
    var totalFlazhCard: Int
}

class NotesCategoryModelRealm: Object, Identifiable {
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var categoryName: String
    @Persisted var totalFlazhCard: Int
}
