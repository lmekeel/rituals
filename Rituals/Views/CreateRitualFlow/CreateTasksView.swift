//
//  CreateTasksView.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/28/24.
//

import SwiftUI

struct CreateTasksView: View {
    @State private var ritualTasks = [Task]()
    @State private var isPresented = false
    @State private var dragOffset: CGFloat = 0
    let minutes = Array(0...60)
    let hours = Array(0...12)
    
    var onTasksCreated: ([Task]) -> Void
    
    var body: some View {
        VStack{
            VStack{
                Text("What elements are in your ritual?")
                    .font(.system(size: 25, weight: .bold, design: .serif))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 244)
                    .padding()

                    List{
                        Button{
                            withAnimation{
                                isPresented.toggle()
                            }
                        }label: {
                            Label(
                                title: { Text("Add") },
                                icon: { Image(systemName: "plus") }
                            )
                            .foregroundStyle(Color.black)
                        }
                        
                        ForEach(ritualTasks, id: \.self){
                            task in
                            HStack{
                                Text(task.name ?? "")
                                Spacer()
                                Text("\(task.hours) h \(task.minutes) m")
                            }
                        }
                        .onMove(perform: move)
                        .onDelete(perform: delete)
                    }
                    .frame(maxHeight: 350)
            
            }.padding(.vertical)
            Spacer()
        }
        
        .sheet(isPresented: $isPresented){
            AddTaskView(ritualTasks: $ritualTasks)
                .presentationDetents([.medium])
        }
        
        .onChange(of: ritualTasks){
            onTasksCreated(ritualTasks)
        }
        
    }
    
    func move(from source: IndexSet, to destination: Int){
        ritualTasks.move(fromOffsets: source, toOffset: destination)
        
    }
    func delete(at offsets: IndexSet){
            ritualTasks.remove(atOffsets: offsets)
            
    }
}

/*
#Preview {
    CreateTasksView()
}
*/
