//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Jifeng Zhang on 2017-08-26.
//  Copyright © 2017 Jifeng Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(gameState: .start)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockSign: UIButton!
    @IBOutlet weak var paperSign: UIButton!
    @IBOutlet weak var scissorsSign: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!

    
    @IBAction func choseRock(_ sender: UIButton) {
        play(sign: .rock)
    }
    
    
    @IBAction func chosePaper(_ sender: UIButton) {
        play(sign: .paper)
    }
    
    
    @IBAction func choseScissors(_ sender: UIButton) {
        play(sign: .scissors)
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        updateUI(gameState: .start)
    }
    
    func play(sign: Sign){
        let robotSign = randomSign()
        let gameState = sign.compare(opponentSign: robotSign)
        updateUI(gameState: gameState)
        appSign.text = robotSign.emoji
        rockSign.isEnabled = false
        paperSign.isEnabled = false
        scissorsSign.isEnabled = false
        
        switch sign {
        case .rock:
            paperSign.isHidden = true
            scissorsSign.isHidden = true
        case .paper:
            rockSign.isHidden = true
            scissorsSign.isHidden = true
        case .scissors:
            rockSign.isHidden = true
            paperSign.isHidden = true
        }
        playAgainButton.isHidden = false
    }
    
    func updateUI(gameState: GameState){
        if gameState == .start {
            appSign.text = "🤖"
            gameStatus.text = "剪，包，锤"
            playAgainButton.isHidden = true
            rockSign.isHidden = false
            rockSign.isEnabled = true
            paperSign.isHidden = false
            paperSign.isEnabled = true
            scissorsSign.isHidden = false
            scissorsSign.isEnabled = true
        }else if gameState == .draw {
            gameStatus.text = "平手"
        }else if gameState == .lose {
            gameStatus.text = "你输了"
        }else if gameState == .win {
            gameStatus.text = "你赢了"
        }
    }
}

