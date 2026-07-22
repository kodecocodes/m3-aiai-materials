/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    PrimaryButton(configuration: configuration)
  }

  private struct PrimaryButton: View {
    let configuration: Configuration
    @Environment(\.isEnabled)
      private var isEnabled
    var body: some View {
      configuration.label
        .font(.headline)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.accent.opacity(isEnabled ? 1 : 0.3))
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: Constants.General.cornerRadius))
        .opacity(configuration.isPressed ? 0.8 : 1)
    }
  }
}

struct SecondaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    SecondaryButton(configuration: configuration)
  }

  private struct SecondaryButton: View {
    let configuration: Configuration
    @Environment(\.isEnabled)
      private var isEnabled
    var body: some View {
      configuration.label
        .font(.headline)
        .foregroundStyle(Color.accent.opacity(isEnabled ? 1 : 0.3))
        .opacity(configuration.isPressed ? 0.6 : 1)
    }
  }
}
