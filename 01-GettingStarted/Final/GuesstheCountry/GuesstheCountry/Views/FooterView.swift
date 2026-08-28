/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

struct FooterView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  var body: some View {
    VStack(spacing: 14) {
      Button(gameSession.isLastQuestion ? "See Summary" : "Next Country") {
        gameSession.advanceToNextQuestion()
      }
      .buttonStyle(PrimaryButtonStyle())

      if gameSession.isLastQuestion == false {
        Button("Stop This Round") {
          gameSession.endRound()
        }
        .buttonStyle(SecondaryButtonStyle())
      }
    }
    .padding(.horizontal, Constants.General.screenPadding)
    .padding(.bottom, 12)
  }
}
#Preview {
  FooterView().environment(GameSessionManager())
}
