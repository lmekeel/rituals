//
//  CustomNavButton.swift
//  Rituals
//
//  Created by Lily Mekeel on 3/1/24.
//

import SwiftUI

enum CustomButtomType: String {
    case next = "Next"
    case previous = "Go Back"
    case save = "Save"
}

struct CustomNavButton: View {
    var type: CustomButtomType
    var action: () -> Void
    
    var body: some View {
        Button(action: { action() }) {
            ZStack{
                Text(type.rawValue)
            }
            .padding(10)
            .padding(.horizontal)
            .foregroundStyle(type == .previous ? Color.black : Color.white)
            .background(type == .previous ? RoundedRectangle(cornerRadius: 12).fill(Color.primaryLight) : RoundedRectangle(cornerRadius: 12).fill(Color.primaryDark))
            .padding()
        }
    }
}

#Preview {
    HStack{
        CustomNavButton(type: .previous, action: {})
        CustomNavButton(type: .next, action: {})

        
    }
        
}
