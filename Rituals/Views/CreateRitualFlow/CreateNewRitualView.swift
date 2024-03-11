//
//  CreateNewRitualView.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/14/24.
//

import SwiftUI


//Need to save input from each page into variables
//at the end, everything needs to get saved together and passing those variables into the viewmodel functions


struct CreateNewRitualView: View {
    @State private var currentPage: Int = 0
    @State private var isNameValid = false
    @State private var ritualName = ""
    @State private var ritualTasks = [Task]()
    @State var viewModel = CreatingRitualViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            tabView
            navBar
        }
        .toolbar(.hidden, for: .tabBar)
        Spacer()
    }
    
    
    var tabView: some View {
        TabView(selection: $currentPage){
            EnterRitualNameView(onNameValidated: {isValid, name in
                self.isNameValid = isValid
                self.ritualName = name
                print(name)}) //pass the ritual name here through the closure
                .tag(0)
            CreateTasksView(onTasksCreated: { ritualTasks in
                self.ritualTasks = ritualTasks
                for task in ritualTasks{
                    print(task)
                }
                
            })//Pass the completed array here through a closure
                .tag(1)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onAppear{
            UIScrollView.appearance().isScrollEnabled = false
        }
        .onDisappear{
            UIScrollView.appearance().isScrollEnabled = true
        }
    }
    
    var navBar: some View {
        HStack{
            if currentPage == 0{
                CustomNavButton(type: .next){
                    self.currentPage += 1
                }
                .disabled(!isNameValid)
            }else if currentPage == 1 {
                CustomNavButton(type: .previous){
                    self.currentPage -= 1
                }

                CustomNavButton(type: .save){
                    viewModel.addRitual(title: ritualName, tasks: ritualTasks)
                    presentationMode.wrappedValue.dismiss()
                    
                }
            }
            
        }
    }
}

#Preview {
    CreateNewRitualView()
}
