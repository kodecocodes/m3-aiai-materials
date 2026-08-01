/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

struct IncorrectView: View {
  @Environment(GameSessionManager.self)
    private var gameSession
  var body: some View {
    VStack(spacing: 24) {
      Spacer()
      Image(systemName: "arrow.trianglehead.counterclockwise")
        .font(.system(size: 64))
        .foregroundStyle(Color.tryAgain)
      VStack(spacing: 8) {
        Text("Try Again!")
          .font(.largeTitle.weight(.bold))
        Text("The next clue might be the one that clicks.")
          .font(.body)
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 32)
      }
      Spacer()
      Button("Reveal Clue \(gameSession.clueIndex + 2)") {
        gameSession.revealNextClue()
      }
      .buttonStyle(PrimaryButtonStyle())
      .padding(.horizontal, Constants.General.screenPadding)
      .padding(.bottom, 12)
    }
  }
}

#Preview {
  IncorrectView().environment(GameSessionManager())
}
