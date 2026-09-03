/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

/// **Classic**: When the user incorrectly guesses the country name in the middle of the game with clues remaining,
/// show a try again screen and encourage the user to continue the game with remaining clues. No difference in points.
/// When the user incorrectly guesses the country name in the middle of the game with 0 clues remaining,
/// show a revealed screen with correct answer and a fun fact.
/// When the user incorrectly guesses the country name, a correct screen is shown with points and clues for that one country.
///
/// **Streak**: Streak mode user takes the risk and continues to play the next rounds. The risk is: A wrong guess ends the run instantly,
/// even if clues remain. For the standard (or classic) user, a wrong guess is nearly free (you just see the next clue).
/// In streak mode, every guess is a real gamble: "I'm 80% sure it's Chile... but is 80% enough to bet the whole run?".
///
/// **Blitz**: Users can see one clue for a maximum time of 1 minute (or less). Once the timer expires - the next clue is shown automatically.
/// Users can't go back to see the previous clue. The idea is users will have to read the clues in this time and also remember them to make the guess.
/// The point system now changes. It will be 40 (end of 1st clue), 30 (end of 2nd clue), 20 (end of 3rd clue), 10 (at the end of 4th clue). In this mode, the users get an opportunity to score more points. Maximum points for each round will be 40 now (instead of 20 in standard/ classic mode).

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
