/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import Foundation

@Observable
class GameSessionManager {
  var currentMode: GameModes = .classic // by default
  var phase: Phase = .home // by default
  var allCountries: [Country] = []

  static let classicPointsPerClue = [20, 15, 10, 5]
  static let blitzPointsPerClue = [40, 30, 20, 10]
  static let blitzClueDuration = 20

  var totalPoints: Int = 0
  var round = 1
  var clueIndex = 0
  var questions: [Country] = []
  var questionIndex: Int = 0
  var results: [CountryGuessed] = []
  var blitzSecondsRemaining = blitzClueDuration

  private var blitzTimerTask: Task<Void, Never>?

  init() {
    loadCountries()
  }

  var pointsPerClue: [Int] {
    currentMode == .blitz ? Self.blitzPointsPerClue : Self.classicPointsPerClue
  }

  var clueCount: Int {
    pointsPerClue.count
  }

  var isFirstClue: Bool {
    clueIndex == 0
  }

  var isLastClue: Bool {
    clueIndex == clueCount - 1
  }

  var pointsAtStake: Int {
    pointsPerClue[clueIndex]
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
    stopBlitzTimer()
    currentMode = mode
    totalPoints = 0
    round = 1
    questionIndex = 0
    clueIndex = 0
    results = []
    questions = self.allCountries.shuffled()
    phase = .clue
    startBlitzTimerIfNeeded()
  }

  func endRound() {
    stopBlitzTimer()
    phase = .summary
  }

  func revealPreviousClue() {
    guard currentMode != .blitz else { return }
    guard isFirstClue == false else { return }
    clueIndex -= 1
    phase = .clue
  }

  func revealNextClue() {
    guard isLastClue == false else { return }
    clueIndex += 1
    phase = .clue
    startBlitzTimerIfNeeded()
  }

  func advanceToNextQuestion() {
    if isLastQuestion {
      stopBlitzTimer()
      phase = .summary
      return
    }
    questionIndex += 1
    clueIndex = 0
    phase = .clue
    startBlitzTimerIfNeeded()
  }

  func submitGuess(_ guess: String) {
    guard let question = currentQuestion else { return }
    stopBlitzTimer()

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
    } else if currentMode == .streak {
      // In streak mode a wrong guess ends the run immediately
      results.append(
        CountryGuessed(
          answer: question.answer,
          isCorrect: false,
          cluesUsed: clueIndex + 1,
          score: 0))
      phase = .summary
    } else if isLastClue {
      failCurrentQuestion()
    } else {
      phase = .incorrect
    }
  }

  private func failCurrentQuestion() {
    guard let question = currentQuestion else { return }
    results.append(
      CountryGuessed(
        answer: question.answer,
        isCorrect: false,
        cluesUsed: clueCount,
        score: 0))
    phase = .revealed
  }

  private func startBlitzTimerIfNeeded() {
    stopBlitzTimer()
    guard currentMode == .blitz, phase == .clue else { return }

    blitzSecondsRemaining = Self.blitzClueDuration
    blitzTimerTask = Task { @MainActor [weak self] in
      while let self, self.blitzSecondsRemaining > 0 {
        try? await Task.sleep(for: .seconds(1))
        guard !Task.isCancelled else { return }
        self.blitzSecondsRemaining -= 1
      }
      guard let self, !Task.isCancelled else { return }
      self.handleBlitzTimerExpired()
    }
  }

  private func stopBlitzTimer() {
    blitzTimerTask?.cancel()
    blitzTimerTask = nil
  }

  private func handleBlitzTimerExpired() {
    guard currentMode == .blitz, phase == .clue else { return }

    if isLastClue {
      stopBlitzTimer()
      failCurrentQuestion()
    } else {
      clueIndex += 1
      startBlitzTimerIfNeeded()
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
