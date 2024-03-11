//
//  FABButton.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/14/24.
//

import SwiftUI

struct FABButton: View {
    var body: some View {
        
                Image(systemName: "plus")
                    .font(.title.weight(.semibold))
                    .padding()
                    .background(Color.primaryLight)
                    .foregroundStyle(.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
           
        
    }
}

#Preview {
    FABButton()
}
