/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

struct HomeView: View {
  @State private var selectedGameMode: GameModes = .classic // by default
  @Environment(GameSessionManager.self)
  private var gameSession

  var body: some View {
    VStack {
      Spacer()
      TitleView()
      GameModesView(selectedGameMode: $selectedGameMode)
      PointsView()
      Spacer()
      StartGameView(selectedGameMode: selectedGameMode) // read-only selectedGameMode
    }
    .background(Color(.systemBackground))
  }
}

struct TitleView: View {
  var body: some View {
    Image(systemName: "globe.europe.africa.fill")
      .font(.system(size: 56))
      .foregroundStyle(Color.accent)
      .padding(.bottom, 20)
    Text("Guess the Country")
      .font(.system(size: 40, weight: .bold))

    Text("in as few clues as you can.")
      .font(.body)
      .foregroundStyle(.secondary)
      .multilineTextAlignment(.center)
      .padding(.top, 8)
      .padding(.horizontal, 32)
  }
}

struct GameModesView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  @Binding var selectedGameMode: GameModes
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      ForEach(GameModes.allCases) { mode in
        let isSelected = checkIfGameModeSelected(currentGameMode: mode.rawValue)
        Button {
          selectedGameMode = mode
        } label: {
          HStack(spacing: 12) {
            Image(systemName: mode.icon)
              .font(.body)
              .foregroundStyle(isSelected ? Color.accent : Color.secondary)
              .frame(width: 26)
            VStack(alignment: .leading, spacing: 2) {
              Text(mode.title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.primary)
              Text(mode.subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
            }

            Spacer()
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
              .foregroundStyle(isSelected ? Color.accent : Color.unmuted)
              .padding(14)
          }
          .padding(14)
          .background(Color.muted)
          .clipShape(RoundedRectangle(cornerRadius: Constants.General.cornerRadius))
          .overlay(
            RoundedRectangle(cornerRadius: Constants.General.cornerRadius)
              .strokeBorder(isSelected ? Color.accent : .clear, lineWidth: 2)
          )
        }.buttonStyle(.plain) // Prevents default blue tint
      }
    }
  }

  func checkIfGameModeSelected(currentGameMode: String) -> Bool {
    var isSelected = false
    if selectedGameMode.rawValue == currentGameMode {
      isSelected = true
    }
    return isSelected
  }
}

struct PointsView: View {
  var body: some View {
    Text("20 · 15 · 10 · 5 points by clue")
      .font(.caption)
      .foregroundStyle(.secondary)
      .padding(.top, 14)
  }
}

struct StartGameView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  let selectedGameMode: GameModes // this view only reads the selectedGameMode

  var body: some View {
    Button("Start Game") {
      gameSession.phase = .clue
      gameSession.startGame(mode: selectedGameMode)
    }
    .buttonStyle(PrimaryButtonStyle())
    .padding(.horizontal, Constants.General.screenPadding)
    .padding(.bottom, 12)
  }
}

#Preview {
  HomeView().environment(GameSessionManager())
}
