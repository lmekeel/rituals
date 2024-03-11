//
//  Task+CoreDataClass.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/7/24.
//
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var minutes: Int16
    @NSManaged var hours: Int16
    
    required convenience init(context: NSManagedObjectContext) {
        // Get the entity description for the Task entity
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else {
            fatalError("Failed to initialize Task entity description")
        }
        
        // Initialize the managed object with the entity description and managed object context
        self.init(entity: entity, insertInto: context)
    }
}
