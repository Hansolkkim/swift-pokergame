//
//  PockerGame.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class PokerGame {
    enum StudRule: Int {
        
        case sevenCardStud = 7
        case fiveCardStud = 5
        
        var numberOfCard: Int {
            switch self {
            case .sevenCardStud: return 7
            case .fiveCardStud: return 5
            }
        }
        
        func isContinuable(number1: Int, number2: Int) -> Bool {
            return number1 >= self.rawValue * number2
        }
    }
    
    let dealer: Dealer
    let gamblers: Gamblers
    let gameRule: StudRule
    
    init(numberOfGamblers: Gamblers.count, gameRule: StudRule) {
        
        self.dealer = Dealer()
        self.gamblers = Gamblers.init(with: numberOfGamblers)
        self.gameRule = gameRule
    }
    
    public func distributeCard() {
        dealer.distributeCard(to: gamblers, in: gameRule)
    }
}
