//
//  HomeView.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/6/24.
//

import SwiftUI
import CoreData


struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Ritual.entity(), sortDescriptors: []) var rituals: FetchedResults<Ritual>
    
    var body: some View {
        NavigationStack{
            VStack{
                Title(title: .constant("RITUALS"))
                Daily_Quote()

                    ZStack(alignment: .bottomTrailing){
                        List {
                            ForEach(rituals, id: \.self) { ritual in
                                Ritual_Card(ritual: Binding.constant(ritual))
                                    .listRowSeparator(.hidden)
                                    .padding(.bottom)
                            }
                            .onDelete(perform: { indexSet in
                                deleteItems(offsets: indexSet)
                            })
                            
                        }.listStyle(.plain)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    EditButton().foregroundStyle(.black)
                                }
                            }
                        HStack{
                            NavigationLink{
                                CreateNewRitualView()
                                   
                            }label: {
                                FABButton()
                                    .padding()
                            }
                        }
                    }
                }
            }
        
    }


        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                offsets.map { rituals[$0] }.forEach(viewContext.delete)
                            
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
 
    }

    
    
#Preview {
    HomeView()
}
