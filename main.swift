//
//  main.swift
//  quoter
//
//  Created by Pavel Arkharov on 28.6.2025.
//

import Foundation

if let quote = QuoteManager.shared.getRandomQuote() {
    print("💡 \(quote.text)\n— \(quote.author)")
} else {
    print("No quotes available.")
}
