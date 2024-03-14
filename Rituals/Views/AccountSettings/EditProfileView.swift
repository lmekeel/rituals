//
//  EditProfileView.swift
//  Rituals
//
//  Created by Lily Mekeel on 3/14/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var name = ""
    @State private var isHovering = false
    var body: some View {
        NavigationStack{
            VStack{
                Button{
                    
                }label: {
                    Image("blank-profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                Text("Edit")
                    .foregroundStyle(Color.primaryDark)
                //Add textfield validation here to check if changed and notEmpty
                TextField("enter new username", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                CustomNavButton(type: .save){
                    
                }
               
            }
            .padding()
            .navigationTitle("Edit Profile")
            .toolbar(.hidden, for:.tabBar)
            Spacer()
        }
        
        
    }
}

#Preview {
    EditProfileView()
}
