//
//  QuoteViewModel.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/21/24.
//

import Foundation


class APIManager: ObservableObject {
    @Published var quote: String = ""
    @Published var author: String = ""
    
    static let shared = APIManager()
    private init() {
        
    }
    
    private let userDefaults = UserDefaults.standard

    func isCachedQuoteValid() -> Bool {
            // Retrieve cached date from UserDefaults
            guard let cachedDate = userDefaults.object(forKey: "cachedDate") as? Date else {
                return false // Cached date not found, cache is invalid
            }
            
            // Check if cached date is today
            return Calendar.current.isDateInToday(cachedDate)
        }
    
    func fetchQuote() {
        
        //Check if there is a cached quote for today
        if let cachedQuoteData = userDefaults.data(forKey: "cachedQuote"),
           let cachedQuote = try? JSONDecoder().decode(Quote.self, from: cachedQuoteData),
           let cachedDate = userDefaults.object(forKey: "cachedDate") as? Date,
           Calendar.current.isDateInToday(cachedDate){
            //Use cached quote if it's from today
            self.quote = cachedQuote.q
            self.author = cachedQuote.a
            return
        }
        
        //Fetch new quote from API if no cached quote for today
        guard let url = URL(string: "https://zenquotes.io/api/quotes/") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            
            do{
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                if let firstQuote = quotes.first {
                    DispatchQueue.main.async {
                        //Cache the fetched quote and date
                        self.userDefaults.set(data, forKey: "cachedQuote")
                        self.userDefaults.set(Date(), forKey: "cachedDate")
                        self.quote = firstQuote.q
                        self.author = firstQuote.a
                    }
                }
            }catch {
                print("Failed to decode response: \(error.localizedDescription)")
            }
        }.resume()
        
    }
}
