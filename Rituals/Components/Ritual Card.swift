//
//  Ritual Card.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/7/24.
//

import SwiftUI

struct Ritual_Card: View {
    @Binding var ritual: Ritual
    @State private var isDisclosed = false
    @State var ritualTitle: String = "Morning"
    
    var body: some View {
        ZStack {
            // Shadowed background with rounded corners
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            VStack{
                //Title and Menu Button
                HStack{
                    GroupBox(label: Text(ritual.title ?? "Title")) {
                                        }.groupBoxStyle(RitualCardStyle())
                   Spacer()
                    Menu{
                        Button("Edit"){
                            //Figure out how to navigate to edit task view for specific card
                        }
                    } label: {
                        Label("Menu", systemImage: "ellipsis")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.black)
                    }
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .padding(.trailing)
                }.padding(.bottom, 30)
                Button{
                    withAnimation(.easeInOut(duration: 0.55)){
                        isDisclosed.toggle()
                    }
                } label: {
                    isDisclosed ?
                    Label("Expand", systemImage: "chevron.up")
                        .opacity(0.3)
                        .foregroundColor(.black)
                        .labelStyle(.iconOnly)
                    :
                    Label("Expand", systemImage: "chevron.down")
                        .opacity(0.3)
                        .foregroundColor(.black)
                        .labelStyle(.iconOnly)
                }
                //Tasks when expanded
                if isDisclosed {
                    GroupBox() {
                        if let tasks = ritual.tasks?.allObjects as? [Task] {
                            ForEach(tasks){ task in
                                Ritual_Task(title: task.name ?? "", hour: Int(task.hours), minute: Int(task.minutes))

                            }
                        }
                    }
                    .groupBoxStyle(RitualCardStyle())
                        }
                
            }.padding(5)
        }
    }
}

struct RitualCardStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontDesign(.serif)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(5)
        configuration.content
            .fontDesign(.serif)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 15)
            .padding(.trailing, 10)
            
        
    }
}

/*
 #Preview {
    Ritual_Card()
 }
 */
