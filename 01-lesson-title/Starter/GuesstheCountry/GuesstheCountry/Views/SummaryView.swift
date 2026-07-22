/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

struct SummaryView: View {
  var body: some View {
    HeaderView()
    BodyView()
  }
}

struct HeaderView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  var body: some View {
    Text("Round Complete")
      .font(.footnote.weight(.semibold))
      .tracking(1)
      .textCase(.uppercase)
      .foregroundStyle(.secondary)
    Text("\(gameSession.totalPoints)")
      .font(.system(size: 72, weight: .bold, design: .rounded))
      .foregroundStyle(Color.accent)
    Text(gameSession.totalPoints == 1 ? "point" : "points")
      .font(.body)
      .foregroundStyle(.secondary)
  }
}

struct BodyView: View {
  @Environment(GameSessionManager.self)
  private var gameSession
  var body: some View {
    VStack {
      ForEach(gameSession.results) { result in
        HStack(spacing: 12) {
          Image(systemName: result.isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
            .foregroundStyle(result.isCorrect ? Color.success : Color.tryAgain)
          VStack(alignment: .leading, spacing: 2) {
            Text(result.answer)
              .font(.subheadline.weight(.semibold))
            Text(result.isCorrect
              ? "\(result.cluesUsed) \(result.cluesUsed == 1 ? "clue" : "clues") used"
              : "Missed")
            .font(.caption)
            .foregroundStyle(.secondary)
          }
          Spacer()
          Text("+\(result.score)")
            .font(.subheadline.weight(.bold))
            .foregroundStyle(result.isCorrect ? Color.success : .secondary)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        if result.id != gameSession.results.last?.id {
          Divider().padding(.leading, 44)
        }
      }
    }
    .background(Color.muted)
    .clipShape(RoundedRectangle(cornerRadius: Constants.General.cornerRadius))
    .padding(.horizontal, Constants.General.screenPadding)
    .padding(.top, 28)
  }
}

#Preview {
  SummaryView().environment(GameSessionManager())
}
