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
  @State private var secondsRemaining = GameSessionManager.blitzClueDurationSeconds

  var body: some View {
    Group {
      if gameSession.currentMode == .streak {
        HStack {
          Text("Clue \(gameSession.clueIndex + 1) of \(gameSession.pointsPerClue.count)")
            .font(.footnote.weight(.medium))
            .foregroundStyle(.secondary)
          Spacer()
          HStack(spacing: 4) {
            Image(systemName: "flame.fill")
              .font(.footnote)
              .foregroundStyle(Color.accent)
            Text("\(gameSession.streakLength)")
              .font(.footnote.weight(.semibold))
              .foregroundStyle(Color.accent)
          }
        }
        .padding(.horizontal, Constants.General.screenPadding)
        .padding(.top, 28)
      } else {
        HStack(spacing: 6) {
          ForEach(0..<gameSession.pointsPerClue.count, id: \.self) { index in
            Capsule()
              .fill(index <= gameSession.clueIndex ? Color.accent : Color.slightProminent)
              .frame(height: 4)
          }
        }
        .padding(.horizontal, Constants.General.screenPadding)
        .padding(.top, 16)

        HStack {
          Text("Clue \(gameSession.clueIndex + 1) of \(gameSession.pointsPerClue.count)")
            .font(.footnote.weight(.medium))
            .foregroundStyle(.secondary)
          Spacer()
          if gameSession.currentMode == .blitz {
            HStack(spacing: 4) {
              Image(systemName: "timer")
                .font(.footnote)
              Text(formattedTime(secondsRemaining))
                .font(.footnote.weight(.semibold).monospacedDigit())
            }
            .foregroundStyle(secondsRemaining <= 10 ? Color.tryAgain : Color.accent)
            .padding(.trailing, 12)
          }
          Text("\(gameSession.pointsAtStake) points")
            .font(.footnote.weight(.semibold))
            .foregroundStyle(Color.accent)
        }
        .padding(.horizontal, Constants.General.screenPadding)
        .padding(.top, 12)
      }
    }
    .task(id: blitzTimerID) {
      guard gameSession.currentMode == .blitz else { return }
      secondsRemaining = GameSessionManager.blitzClueDurationSeconds
      while secondsRemaining > 0 {
        do {
          try await Task.sleep(for: .seconds(1))
        } catch {
          return
        }
        guard !Task.isCancelled else { return }
        secondsRemaining -= 1
      }
      guard gameSession.phase == .clue, !gameSession.isLastClue else { return }
      gameSession.revealNextClue()
    }
  }

  private var blitzTimerID: String {
    "\(gameSession.questionIndex)-\(gameSession.clueIndex)-\(gameSession.currentMode.rawValue)"
  }

  private func formattedTime(_ seconds: Int) -> String {
    let minutes = seconds / 60
    let remainingSeconds = seconds % 60
    return String(format: "%d:%02d", minutes, remainingSeconds)
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

      if gameSession.currentMode == .classic {
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
      } else if gameSession.currentMode == .blitz {
        Button("Next Clue") {
          gameSession.revealNextClue()
        }
        .buttonStyle(SecondaryButtonStyle())
        .disabled(gameSession.isLastClue)
        .padding(.bottom, 6)
      }
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
