//
//  MoviesApp.swift
//  Movies
//
//  Created by Lucca Beurmann on 21/02/23.
//

import SwiftUI

@main
struct MoviesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
