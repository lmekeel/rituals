//
//  RitualsApp.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/6/24.
//

import SwiftUI

@main
struct RitualsApp: App {
    let persistenceController = CoreDataManager.instance

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
