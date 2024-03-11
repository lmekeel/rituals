//
//  CreatingRitualViewModel.swift
//  Rituals
//
//  Created by Lily Mekeel on 3/1/24.
//

import SwiftUI
import CoreData

class CreatingRitualViewModel: ObservableObject {
    
    @Published var ritualName: String = ""
    
    let manager = CoreDataManager.instance
    
    @Published var savedRituals: [Ritual] = []
    
    init(){
        fetchRituals()
    }

    func fetchRituals(){
        let request = NSFetchRequest<Ritual>(entityName: "Ritual")
        
        do{
            savedRituals = try manager.context.fetch(request)
        } catch let error{
            print("Error fetching. \(error)")
        }
        
    }
    
    func addRitual(title: String, tasks: [Task]){
        let newRitual = Ritual(context: manager.context)
        newRitual.title = title
        
        for task in tasks {
            newRitual.addToTasks(task)
            print(task)
        }
      
        save()
    }
        
    func deleteRitual(_ indexSet: IndexSet) {
      //Implement later
     }
   
    func save() {
        manager.save()
    }
    
}
