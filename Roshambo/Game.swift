//
//  Game.swift
//  Roshambo
//
//  Created by Robert DeLaurentis on 2/22/18.
//  Copyright © 2018 Robert DeLaurentis. All rights reserved.
//

import Foundation

enum GameState {
  case win
  case lose
  case draw
}

struct Game {

  var hand1: Hand
  let hand2 = Hand.random

  init(player: Hand) {
    self.hand1 = player
  }

  var playerStatus: GameState {
    return play(hand1, hand2)
  }

  var labelText: String {
    return getLabelText(hand1, hand2)
  }

  func play(_ hand1: Hand, _ hand2: Hand) -> GameState {

    if hand1 == hand2 { return .draw }

    switch hand1 {
    case .rock:
      return hand2 == .scissors ? .win : .lose
    case .paper:
      return hand2 == .rock ? .win : .lose
    case .scissors:
      return (hand2 == .paper ? .win : .lose)
    }
  }

  func getLabelText(_ hand1: Hand, _ hand2: Hand) -> String {

    let handSet = Set([hand1, hand2])

    switch handSet {
    case Set([.paper, .scissors]):
      return ("Scissors CUT Paper")
    case Set([.rock, .scissors]):
      return ("Rock CRUSHES Scissors")
    case Set([.rock, .paper]):
      return ("Paper COVERS Rock")
    default:
      return ("Draw")
    }

  }


}
