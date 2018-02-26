//
//  Game.swift
//  Roshambo
//
//  Created by Robert DeLaurentis on 2/22/18.
//  Copyright © 2018 Robert DeLaurentis. All rights reserved.
//

import Foundation


struct Game {

  var hand1: Hand
  let hand2: Hand

  init(player: Hand) {
    self.hand1 = player
    self.hand2 = Hand.random
    print("Game init complete")
  }

  // return win, lose, or draw
  var playerStatus: GameState {
    return play(hand1, hand2)
  }

  // determine winner
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
}
