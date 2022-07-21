//
//  flazhcardApp.swift
//  flazhcard
//
//  Created by vica valencia on 21/07/22.
//

import SwiftUI

@main
struct flazhcardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
