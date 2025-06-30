//
//  QuoteManager.swift
//  quoter
//
//  Created by Pavel Arkharov on 28.6.2025.
//

import Foundation

class QuoteManager {
    static let shared = QuoteManager()
    
    private var quotes: [Quote] = []
    private var isLoaded = false
    
    private init() {}
    
    func loadQuotes() {
        guard !isLoaded else { return }
        quotes = embeddedQuotes
        isLoaded = true
    }
    
    func getRandomQuote() -> Quote? {
        if !isLoaded {
            loadQuotes()
        }
        return quotes.randomElement()
    }
    
    func getAllQuotes() -> [Quote] {
        if !isLoaded {
            loadQuotes()
        }
        return quotes
    }
}
