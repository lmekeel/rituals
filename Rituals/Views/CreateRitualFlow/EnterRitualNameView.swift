//
//  EnterRitualNameView.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/28/24.
//

import SwiftUI

struct EnterRitualNameView: View {
    @State private var name: String = ""
    var onNameValidated: (Bool, String) -> Void
    
    var body: some View {
       @StateObject var viewModel = CreatingRitualViewModel()
        @State var ritualName: String = ""
        
        VStack(alignment:.center){
            Text("Let's give your Ritual a name")
                .font(.system(size: 40, weight: .bold, design: .serif))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 244)
            
            TextField("enter name...", text: $name)
                .frame(maxWidth: 250)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
   
        }
        .onChange(of: name) {
            onNameValidated(!name.isEmpty, name)
            
        }
    }
}
/*
 #Preview {
 EnterRitualNameView()
 }
 */
