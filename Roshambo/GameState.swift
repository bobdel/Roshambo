//
//  GameState.swift
//  Roshambo
//
//  Created by Robert DeLaurentis on 2/24/18.
//  Copyright © 2018 Robert DeLaurentis. All rights reserved.
//

import Foundation

enum GameState: CustomStringConvertible {

  case win
  case lose
  case draw

  var description: String {

    switch self {
    case .win:
      return "Winner! 😃"
    case .lose:
      return "You Lost 🙁"
    case .draw:
      return "Items Matched. 🤨"
    }
  }

}
