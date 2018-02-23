//
//  MainViewController.swift
//  Roshambo
//
//  Created by Robert DeLaurentis on 2/22/18.
//  Copyright © 2018 Robert DeLaurentis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


  @IBAction func playRound(_ sender: UIButton) {
    let playerHand = Hand(rawValue: sender.tag)!

    let game = Game(player: playerHand)
    
    print(game.hand1, game.hand2, game.playerStatus, game.labelText)
  }
    
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)

  }

} // end MainViewController
