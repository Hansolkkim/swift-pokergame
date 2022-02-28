//
//  Dealer.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class Dealer: Gambler {
    
    private var wholeDeck = CardDeck()
    
    override init(name: String = "딜러") {
        super.init(name: name)
    }
    
    public func distributeCard(to gamblers: Gamblers, in rule: PokerGame.StudRule) {
        shuffleWholeDeck()
        rule.loop(with: gamblers.numberOfGamblers) { gamblerIndex in
            guard let newCard = pickCard() else { return }
            gamblers.receiveCard(newCard, gamblersIndex: gamblerIndex)
        }
    }
    
    private func pickCard() -> Card? {
        return wholeDeck.removeOne()
    }
    
    private func shuffleWholeDeck() {
        self.wholeDeck.shuffle()
    }
    
    public func isAvailableToDistribute(to gamblers: Gamblers, in rule: PokerGame.StudRule) -> Bool {
        return wholeDeck.isAvailableToDistribute(with: gamblers.numberOfGamblers, in: rule)
    }
}
