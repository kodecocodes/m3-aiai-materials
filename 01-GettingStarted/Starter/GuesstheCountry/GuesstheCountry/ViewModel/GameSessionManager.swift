/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import Foundation

@Observable
class GameSessionManager {
  var currentMode: GameModes = .classic
  var phase: Phase = .home
  var allCountries: [Country] = []

  static let pointsPerClue = [20, 15, 10, 5]

  var totalPoints: Int = 0
  var round = 1
  var clueIndex = 0
  var questions: [Country] = []
  var questionIndex: Int = 0
  var results: [CountryGuessed] = []

  init() {
    loadCountries()
  }

  var isFirstClue: Bool {
    clueIndex == 0
  }

  var isLastClue: Bool {
    clueIndex == Self.pointsPerClue.count - 1
  }

  var pointsAtStake: Int {
    Self.pointsPerClue[clueIndex]
  }

  var currentQuestion: Country? {
    questions.indices.contains(questionIndex) ? questions[questionIndex] : nil
  }

  var currentClue: String {
    currentQuestion?.clues[clueIndex] ?? ""
  }

  var isLastQuestion: Bool {
    questionIndex >= questions.count - 1
  }

  func startGame(mode: GameModes) {
    currentMode = mode
    totalPoints = 0
    round = 1
    questions = self.allCountries.shuffled()
    phase = .clue
  }

  func endRound() {
    phase = .summary
  }

  func revealPreviousClue() {
    guard isFirstClue == false else { return }
    clueIndex -= 1
    phase = .clue
  }

  func revealNextClue() {
    guard isLastClue == false else { return }
    clueIndex += 1
    phase = .clue
  }


  func advanceToNextQuestion() {
    if isLastQuestion {
      phase = .summary
      return
    }
    questionIndex += 1
    clueIndex = 0
    phase = .clue
  }

  func submitGuess(_ guess: String) {
    guard let question = currentQuestion else { return }

    if matches(guess, answer: question.answer) {
      let score = pointsAtStake
      let cluesUsed = clueIndex + 1
      totalPoints += score

      results.append(
        CountryGuessed(
          answer: question.answer,
          isCorrect: true,
          cluesUsed: cluesUsed,
          score: score))

      phase = .correct(score: score, cluesUsed: cluesUsed)
    } else if isLastClue {
      results.append(
        CountryGuessed(
          answer: question.answer,
          isCorrect: false,
          cluesUsed: Self.pointsPerClue.count,
          score: 0))
      phase = .revealed
    } else {
      phase = .incorrect
    }
  }

  private func loadCountries() {
    guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else {
      print("Could not find countries.json")
      return
    }

    do {
      let data = try Data(contentsOf: url)
      let decodedCountries = try JSONDecoder().decode([Country].self, from: data)
      self.allCountries = decodedCountries
    } catch {
      print("Error parsing JSON: \(error)")
    }
  }

  private func matches(_ guess: String, answer: String) -> Bool {
    if cleanedText(guess) == cleanedText(answer) {
      return true
    }
    return false
  }

  private func cleanedText(_ text: String) -> String {
    let cleanedText = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    return cleanedText
  }
}
