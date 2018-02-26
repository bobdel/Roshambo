//
//  Hand.swift
//  Roshambo
//
//  Created by Robert DeLaurentis on 2/22/18.
//  Copyright © 2018 Robert DeLaurentis. All rights reserved.
//

import Foundation

enum Hand: Int, CustomStringConvertible {

  case rock = 1
  case paper
  case scissors

  static var random: Hand {
    return Hand(rawValue: Int(1 + arc4random() % 3))!
  }


  var description: String {
    switch self {
    case .rock:
      return "Rock"
    case .paper:
      return "Paper"
    case .scissors:
      return "Scissors"
    }
  }


}
