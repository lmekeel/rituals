//
//  Ritual Task.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/7/24.
//

import SwiftUI

struct Ritual_Task: View {
    @State var title: String = "Title"
    @State var hour: Int = 0
    @State var minute: Int = 0
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Text(hour == 0 && minute == 0 ? "": hour == 0 ? "\(minute) m" : minute == 0 ? "\(hour) h" : "\(hour) h \(minute) m")
        }
        
    }
}

#Preview {
    Ritual_Task()
}
