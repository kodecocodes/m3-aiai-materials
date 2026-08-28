/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

struct RevealedView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  var body: some View {
    VStack(spacing: 24) {
      Spacer()
      Image(systemName: "lightbulb.max.fill")
        .font(.system(size: 64))
        .foregroundStyle(Color.accent)
      VStack(spacing: 8) {
        Text("The answer is")
          .font(.body)
          .foregroundStyle(.secondary)
        Text(gameSession.currentQuestion?.answer ?? "")
          .font(.largeTitle.weight(.bold))
      }
      if let fact = gameSession.currentQuestion?.funFact {
        Text(fact)
          .font(.subheadline)
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.center)
          .padding(16)
          .background(Color.muted)
          .clipShape(RoundedRectangle(cornerRadius: Constants.General.cornerRadius))
          .padding(.horizontal, Constants.General.screenPadding)
      }

      Spacer()
      FooterView()
    }
  }
}

#Preview {
  RevealedView().environment(GameSessionManager())
}
