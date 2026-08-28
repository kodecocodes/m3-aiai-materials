/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

/// **Classic**: If the user makes an incorrect guess while clues remain, show
/// the try-again screen and let them continue with the remaining clues. If no
/// clues remain, reveal the correct answer and a fun fact. A correct guess shows
/// the points earned and the number of clues used.
///
/// **Streak**: The user continues playing for as long as they keep guessing
/// correctly. One incorrect guess ends the run immediately, even if clues remain.
///
/// **Blitz**: Each clue appears for up to 20 seconds before the next clue appears
/// automatically. The user can't return to previous clues. Guesses are worth 40,
/// 30, 20, or 10 points, depending on the clue used.

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
    case .classic: "Four clues for each country. Take your time to guess."
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
