//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Jifeng Zhang on 2017-08-26.
//  Copyright © 2017 Jifeng Zhang. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    }else if sign == 1 {
        return .paper
    }else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self{
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func compare(opponentSign: Sign) -> GameState {
        if self == opponentSign{
            return .draw
        }
        
        if self == .rock && opponentSign == .scissors {
            return .win
        }
        if self == .paper && opponentSign == .rock {
            return .win
        }
        if self == .scissors && opponentSign == .paper {
            return .win
        }
        
        if self == .rock && opponentSign == .paper {
            return .lose
        }
        if self == .paper && opponentSign == .scissors {
            return .lose
        }
        if self == .scissors && opponentSign == .rock {
            return .lose
        }
        return .lose
        
//        if self == .rock {
//            switch opponentSign{
//            case .rock:
//                return .draw
//            case .paper:
//                return .lose
//            case .scissors:
//                return .win
//            }
//            if opponentSign == .rock {
//                return .draw
//            }
//            if opponentSign == .paper {
//                return .lose
//            }
//            if opponentSign == .scissors {
//                return .win
//            }
//        }
    }
}
