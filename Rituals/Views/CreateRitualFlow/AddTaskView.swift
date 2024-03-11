//
//  AddTaskView.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/28/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = CreatingRitualViewModel()
    
    @Binding var ritualTasks: [Task] // Binding to pass the array back to createTasksView

    @State private var taskName: String = ""
    @State private var taskMinutes: Int = 0
    @State private var taskHours: Int = 0
    
    let minutes = Array(0...60)
    let hours = Array(0...12)
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("add element name")
                        .fontDesign(.serif)
                        .foregroundStyle(Color.white)
                        .padding(5)
                    Spacer()
                    Button{
                        if(!taskName.isEmpty){
                            let newTask = Task(context: CoreDataManager.instance.context)
                            newTask.name = taskName
                            newTask.hours = Int16(taskHours)
                            newTask.minutes = Int16(taskMinutes) 
                            ritualTasks.append(newTask)
                            dismiss()
                        }else{
                            dismiss()
                        }
                    } label: {
                        Text("save")
                            .padding(5)
                            .padding(.horizontal)
                            .fontDesign(.serif)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
                            .foregroundStyle(Color.primaryDark)
                    }
                }
                
                TextField("Enter name", text: $taskName)
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.white))
                    .autocapitalization(.none)
                
                Text("how much time do you want to set aside for this element?")
                    .fontDesign(.serif)
                    .foregroundStyle(Color.white)
                    .padding(.top, 10)
            }
        HStack(spacing: 10){
                    Picker("Hours", selection: $taskHours) {
                        ForEach(hours.indices, id: \.self) { index in
                            Text("\(self.hours[index])")
                                .foregroundStyle(Color.white)
                        }
                        
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    
                    Text("h")
                        .foregroundStyle(Color.white)
                    
                    Picker("Minutes", selection: $taskMinutes) {
                        ForEach(minutes.indices, id: \.self) { index in
                            Text("\(self.minutes[index])")
                                .foregroundStyle(Color.white)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    
                    Text("m")
                        .foregroundStyle(Color.white)
            }
        .frame(height: 125)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primaryDark)
        .transition(.move(edge: .bottom))
        
        
    }
}

