//
//  Ritual+CoreDataClass.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/7/24.
//
//

import Foundation
import CoreData

@objc(Ritual)
public class Ritual: NSManagedObject, Identifiable {
    public var id = UUID()
    @NSManaged var title: String
    @NSManaged var tasks: [Task]
}
