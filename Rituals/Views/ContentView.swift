//
//  ContentView.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/6/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem({
                    Label("Home", systemImage: "house")
                })
            ExploreView()
                .tabItem({
                    Label("Explore", systemImage: "magnifyingglass")
                })
            AccountView()
                .tabItem({
                    Label("Account", systemImage: "person")
                })
        }.accentColor(.black)
    }
}

#Preview {
    ContentView()
}
