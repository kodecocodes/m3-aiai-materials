/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import Foundation

struct Country: Codable, Identifiable, Equatable {
  let id: Int
  let answer: String
  let clues: [String]
  let funFact: String
}

struct CountryGuessed: Identifiable, Equatable {
  let id = UUID()
  let answer: String
  let isCorrect: Bool
  let cluesUsed: Int
  let score: Int
}
