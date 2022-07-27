//
//  Persistence.swift
//  flazhcard
//
//  Created by vica valencia on 21/07/22.
//

import CoreData

struct PersistenceController {
    
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
     
    init() {
        container = NSPersistentContainer(name: "flazhcard")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
