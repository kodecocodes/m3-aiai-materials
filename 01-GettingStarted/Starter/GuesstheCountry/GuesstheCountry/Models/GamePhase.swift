/// Copyright (c) 2026 Kodeco Inc. See COPYRIGHT for details.

enum Phase: Equatable {
  case home
  case clue
  case correct(score: Int, cluesUsed: Int)
  case incorrect
  case revealed
  case summary
}
