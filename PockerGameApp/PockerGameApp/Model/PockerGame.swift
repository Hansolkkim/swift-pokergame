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
        
        func isBigger(number: Int, than number2: Gamblers.count) -> Bool {
            return number2.isSmaller(than: number, multiplier: self.rawValue)
        }
        
        func loop(with number: Gamblers.count, event: (Int) -> Void) {
            (0..<rawValue).forEach { _ in
                number.loop(){event($0)}
            }
        }
    }
    
    private let dealer: Dealer
    private let gamblers: Gamblers
    private let gameRule: StudRule
    
    init(numberOfGamblers: Gamblers.count, gameRule: StudRule) {
        
        self.dealer = Dealer()
        self.gamblers = Gamblers.init(with: numberOfGamblers)
        self.gameRule = gameRule
    }
    
    public func start() {
        if dealer.isAvailableToDistribute(to: gamblers, in: gameRule) {
            dealer.distributeCard(to: gamblers, in: gameRule)
        }
    }
}
