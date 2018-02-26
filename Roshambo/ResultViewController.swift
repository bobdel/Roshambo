//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Robert DeLaurentis on 2/22/18.
//  Copyright © 2018 Robert DeLaurentis. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

  // properties
  var rvcGame: Game!

  // outlets and actions
  @IBOutlet weak var winLossLabel: UILabel!
  @IBOutlet weak var resultsLabel: UILabel!

  @IBOutlet weak var imageView: UIImageView!
  
  @IBAction func playAgain(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }

  // load results into view before it appears
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    if (rvcGame) != nil {
      getLabelText(rvcGame.hand1, rvcGame.hand2)
      winLossLabel.text = String(describing: rvcGame.playerStatus)
    } else {
      assert(false, "Unable to access game object")
    }
  }

  // determine result text based on hands played
  func getLabelText(_ hand1: Hand, _ hand2: Hand) {

    let handSet = Set([hand1, hand2])

    switch handSet {
    case Set([.paper, .scissors]):
      imageView.image = #imageLiteral(resourceName: "ScissorsCutPaper")
      resultsLabel.text = "Scissors CUT Paper"
    case Set([.rock, .scissors]):
      imageView.image = #imageLiteral(resourceName: "RockCrushesScissors")
      resultsLabel.text = "Rock CRUSHES Scissors"
    case Set([.rock, .paper]):
      imageView.image = #imageLiteral(resourceName: "PaperCoversRock")
      resultsLabel.text = "Paper COVERS Rock"
    default:
      imageView.image = #imageLiteral(resourceName: "itsATie")
      resultsLabel.text = "Try Again"
    }

  }
} // end of ResultViewController
