/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

enum GameModes: String, CaseIterable, Identifiable {
  case classic
  case streak
  case blitz

  var id: String {
    rawValue
  }

  var title: String {
    switch self {
    case .classic: "Classic"
    case .streak: "Streak"
    case .blitz: "Blitz"
    }
  }

  var subtitle: String {
    switch self {
    case .classic: "Four clues for each country, take your time to guess"
    case .streak: "Endless run. One wrong guess ends it."
    case .blitz: "Each clue vanishes after 20 seconds."
    }
  }

  var icon: String {
    switch self {
    case .classic: "globe.europe.africa.fill"
    case .streak: "flame.fill"
    case .blitz: "timer"
    }
  }
}
