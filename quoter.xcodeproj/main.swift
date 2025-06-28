//
//  main.swift
//  quoter
//
//  Created by Pavel Arkharov on 28.6.2025.
//

import Foundation

struct Quote: Codable {
    let text: String
    let author: String
}

struct QuoteDatabase: Codable {
    let quotes: [Quote]
}

let thisFile = URL(fileURLWithPath: #file)
let projectRoot = thisFile.deletingLastPathComponent().deletingLastPathComponent()
let url = projectRoot.appendingPathComponent("Quotes/quotes.json")

print("Looking for file at path: \(url.path)")
do {
    let data = try Data(contentsOf: url)
    let decoded = try JSONDecoder().decode(QuoteDatabase.self, from: data)
    
    if let quote = decoded.quotes.randomElement() {
        print("💡 \(quote.text)\n— \(quote.author)")
    } else {
        print ("No quotes found")
    }
} catch {
    print (" Failed to load quotes.json: \(error.localizedDescription)")
}
print("Hello, World!")
