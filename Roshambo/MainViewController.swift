//
//  MainViewController.swift
//  Roshambo
//
//  Created by Robert DeLaurentis on 2/22/18.
//  Copyright © 2018 Robert DeLaurentis. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  var game: Game! // this var is 'rvcGame' in ResultViewController

  // handle button tap and trigger next ViewController
  @IBAction func playRound(_ sender: UIButton) {

    let playerHand = Hand(rawValue: sender.tag)!
    game = Game(player: playerHand)

    switch sender.tag {
    case 1:   // transition via code only
      rockResults()
    case 2:   // transition via code and storyboard segue
      paperResults()
    case 3:  // transition via storyboard segue only
      scissorsResults()
    default:
      assert(false, "Button Response Invalid")
    }

  }

  // transition via code only
  func rockResults() {
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController

    if let game = game {
      controller.rvcGame = game
      self.present(controller, animated: true, completion: nil)
    } else {
      assert(false, "rockResults didn't have a reference to game yet")
    }

  }

  // transition via code and storyboard segue
  func paperResults() {
    let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController

    if let game = game {
      controller.rvcGame = game
      performSegue(withIdentifier: "resultVC", sender: nil)
    } else {
      assert(false, "rockResults didn't have a reference to game yet")
    }

  }

  // transition via storyboard segue only
  func scissorsResults() {
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "resultVC" || segue.identifier == "scissorsButtonSegue" {

      let controller = segue.destination as! ResultViewController
      // pass the game variable to the next viewController
      controller.rvcGame = game

    }
  }

} // end MainViewController
