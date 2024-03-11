//
//  HomeViewModel.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/21/24.
//

import Foundation
import CoreData
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var rituals: [Ritual] = []
    
    private let managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    //Fetch rituals from Core Data
    func fetchRituals() {
        //core data fetch request
        //if a fetch request is in CoreDataServices rituals = CoreDataService.fetchRituals(context: managedObjectContext)
        
        let request = NSFetchRequest<Ritual>(entityName: "Ritual")
        do{
            rituals = try managedObjectContext.fetch(request)
        } catch let error{
            print("Error fetch \(error)")
        }
    }
    
   func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { rituals[$0] }.forEach(
                managedObjectContext.delete)
                        
            do {
                try managedObjectContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
  
    
    
}

