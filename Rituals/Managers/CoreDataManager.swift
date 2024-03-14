//
//  CoreDataManager.swift
//  Rituals
//
//  Created by Lily Mekeel on 3/1/24.
//

import SwiftUI
import CoreData



class CoreDataManager {
    static let instance = CoreDataManager()  //Singleton instance
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "Rituals")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do{
            try context.save()
        } catch let error {
            print("Error saving core data \(error.localizedDescription)")
        }
    }
}
