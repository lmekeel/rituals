//
//  QuoteModel.swift
//  Rituals
//
//  Created by Lily Mekeel on 2/14/24.
//

// Also check state management
//the quote is disappearing when the user edits the ritual list


import Foundation
import SwiftUI

struct Quote: Codable {
    let q: String //Quote
    let a: String //Author
    
    enum CodingKeys: String, CodingKey {
        case q = "q"
        case a = "a"
    }
    
}


