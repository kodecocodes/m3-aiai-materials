/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

struct CorrectView: View {
  @Environment(GameSessionManager.self)
    private var gameSession
  let score: Int
  let cluesUsed: Int

  var body: some View {
    VStack {
      Spacer()
      Image(systemName: "checkmark.circle.fill")
        .font(.system(size: 64))
        .foregroundStyle(Color.success)
        .padding(.bottom, 20)
      Text("Correct!")
        .font(.footnote.weight(.semibold))
        .tracking(1)
        .textCase(.uppercase)
        .foregroundStyle(.secondary)
      Text(gameSession.currentQuestion?.answer ?? "")
        .font(.system(size: 40, weight: .bold))
        .padding(.top, 4)

      HStack(spacing: 24) {
        VStack(spacing: 2) {
          Text("+\(score)")
            .font(.system(.title, design: .rounded).weight(.bold))
            .foregroundStyle(Color.success)
          Text("points")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        Divider().frame(height: 40)
        VStack(spacing: 2) {
          Text("\(cluesUsed)/\(GameSessionManager.pointsPerClue.count)")
            .font(.system(.title, design: .rounded).weight(.bold))
            .foregroundStyle(Color.accent)
          Text(cluesUsed == 1 ? "clue used" : "clues used")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
      }
      .padding(.vertical, 20)
      .background(Color.muted)
      .clipShape(RoundedRectangle(cornerRadius: Constants.General.cornerRadius))
      .padding(.horizontal, Constants.General.screenPadding)
      .padding(.top, 28)

      Spacer()
      FooterView()
    }
  }
}

#Preview {
  CorrectView(score: 15, cluesUsed: 2).environment(GameSessionManager())
}
