//
//  RitualsApp.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/6/24.
//

import SwiftUI

@main
struct RitualsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
