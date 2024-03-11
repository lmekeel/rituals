//
//  Title.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/14/24.
//

import SwiftUI

struct Title: View {
    @Binding var title: String
    var body: some View {
        Text(title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontDesign(.serif)
    }
}

#Preview {
    Title(title: .constant("RITUALS"))
}
