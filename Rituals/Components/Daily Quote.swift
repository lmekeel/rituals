//
//  Daily Quote.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/14/24.
//

import SwiftUI

struct Daily_Quote: View {
    @ObservedObject var quote = APIManager.shared
    
    var body: some View {
        HStack{
            Text("daily mantra")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
            Spacer()
        }
        VStack{
            if quote.quote.isEmpty {
                Text("Loading...")
            }else{
                Text(quote.quote)
                    .italic()
                    .fontDesign(.serif)
                Text("- \(quote.author)")
                    .fontDesign(.serif)
            }
        }
        .padding(.bottom)
        .padding(.horizontal)
        
        .onAppear{
            //Only fetch quote if it hasn't been fetched yet or if it's not cached for today
            if quote.quote.isEmpty || !quote.isCachedQuoteValid() {
                quote.fetchQuote()
            }
        }
    }
}

#Preview {
    Daily_Quote()
}
