//
//  Dealer.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class Dealer {
    
    private var wholeDeck = CardDeck()
    private var cards = Cards()
    
    public func distributeCard(to gamblers: Gamblers, in rule: PokerGame.StudRule) {
        if wholeDeck.isAvailableToDistribute(with: gamblers.count, in: rule) {
            shuffleWholeDeck()
            for _ in 0..<rule.numberOfCards {
                for index in 0..<gamblers.count {
                    guard let newCard = pickCard() else { return }
                    gamblers[index].receiveCard(newCard)
                }
                guard let newCard = pickCard() else { return }
                cards.add(newCard)
            }
        } else {
            
        }
        
    }
    
    private func pickCard() -> Card? {
        return wholeDeck.removeOne()
    }
    
    private func shuffleWholeDeck() {
        self.wholeDeck.shuffle()
    }
}
