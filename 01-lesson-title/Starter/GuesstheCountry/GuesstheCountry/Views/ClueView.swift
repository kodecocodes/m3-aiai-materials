/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

struct ClueView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  var body: some View {
    VStack {
      TopView()
      Spacer()
      CenterView()
      Spacer()
      BottomView()
    }
  }
}

struct TopView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  var body: some View {
    HStack(spacing: 6) {
      ForEach(0..<GameSessionManager.pointsPerClue.count, id: \.self) { index in
        Capsule()
          .fill(index <= gameSession.clueIndex ? Color.accent : Color.slightProminent)
          .frame(height: 4)
      }
    }
    .padding(.horizontal, Constants.General.screenPadding)
    .padding(.top, 16)

    HStack {
      Text("Clue \(gameSession.clueIndex + 1) of \(GameSessionManager.pointsPerClue.count)")
        .font(.footnote.weight(.medium))
        .foregroundStyle(.secondary)
      Spacer()
      Text("\(gameSession.pointsAtStake) points")
        .font(.footnote.weight(.semibold))
        .foregroundStyle(Color.accent)
    }
    .padding(.horizontal, Constants.General.screenPadding)
    .padding(.top, 12)
  }
}

struct CenterView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  var body: some View {
    VStack {
      Text(gameSession.currentClue)
        .font(.title.weight(.medium))
        .multilineTextAlignment(.center)
        .lineSpacing(6)
        .padding(.horizontal, 32)
    }
  }
}

struct BottomView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  @State private var guess = ""
  @FocusState private var guessFieldFocused: Bool

  var body: some View {
    VStack(spacing: 16) {
      TextField("Type a country", text: $guess)
        .font(.body)
        .padding(16)
        .background(Color.muted)
        .clipShape(RoundedRectangle(cornerRadius: Constants.General.cornerRadius))
        .focused($guessFieldFocused)
        .autocorrectionDisabled()
      Button("Submit Guess") {
        submit()
      }
      .buttonStyle(PrimaryButtonStyle())
      .disabled(guess.trimmingCharacters(in: .whitespaces).isEmpty)

      Button("Previous Clue") {
        gameSession.revealPreviousClue()
      }
      .buttonStyle(SecondaryButtonStyle())
      .disabled(gameSession.isFirstClue)
      .padding(.bottom, 4)

      Button("Next Clue") {
        gameSession.revealNextClue()
      }
      .buttonStyle(SecondaryButtonStyle())
      .disabled(gameSession.isLastClue)
      .padding(.bottom, 6)
    }
    .background(Color(.systemBackground))
    .onAppear {
      guessFieldFocused = true
    }
    .onChange(of: gameSession.questionIndex) {
      guess = ""
    }
  }

  private func submit() {
    let guessTrimmed = guess.trimmingCharacters(in: .whitespaces)
    if guessTrimmed.isEmpty { return }
    guessFieldFocused = false
    guess = ""
    gameSession.submitGuess(guessTrimmed)
  }
}

#Preview {
  ClueView().environment(GameSessionManager())
}
