/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

@main
struct MyApp: App {
  @State private var gameSession = GameSessionManager()
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(gameSession)
    }
  }
}

struct ContentView: View {
  @Environment(GameSessionManager.self)
    private var gameSession

  var body: some View {
    switch gameSession.phase {
    case .home:
      HomeView().environment(gameSession)
    case .clue:
      ClueView()
    case let .correct(score, cluesUsed):
      CorrectView(score: score, cluesUsed: cluesUsed).environment(gameSession)
    case .incorrect:
      IncorrectView().environment(gameSession)
    case .revealed:
      RevealedView().environment(gameSession)
    case .summary:
      SummaryView().environment(gameSession)
    }
  }
}

#Preview {
  ContentView().environment(GameSessionManager())
}
