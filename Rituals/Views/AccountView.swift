//
//  AccountView.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/6/24.
//

import SwiftUI

struct AccountView: View {
    @State private var name: String = "Name"
    
    var body: some View {
        NavigationStack{
            Form{
                Group{
                    VStack(alignment: .leading){
                        Title(title: .constant("Profile"))
                        
                        HStack{
                            Spacer()
                            VStack{
                                Image("blank-profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                Text(name)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Section{

                    Title(title: .constant("Account"))
                    NavigationLink("Edit Profile", destination: EditProfileView())
                        .padding(.horizontal, 3)
                    NavigationLink("My Data", destination: EmptyView())
                        .padding(.horizontal, 3)
                    
                    Title(title: .constant("Settings"))
                    NavigationLink("Notifications", destination: NotificationSettingsView())
                        .padding(.horizontal, 3)
                        
                    Title(title: .constant("Membership"))
                    NavigationLink("Subscribe", destination: SubscribeView())
                        .padding(.horizontal, 3)
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
