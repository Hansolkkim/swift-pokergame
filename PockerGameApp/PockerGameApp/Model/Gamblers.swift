//
//  Gamblers.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/25.
//

import Foundation

struct Gamblers {
    enum count: Int {
        case one = 1
        case two
        case three
        case four
        
        func isSmaller(than number: Int, multiplier: Int) -> Bool {
            return self.rawValue * multiplier <= number
        }
        
        func loop(event: (Int) -> Void) {
            (0..<rawValue).forEach {
                event($0)
            }
        }
    }
    
    var listOfGamblers = [Gambler]()
    var numberOfGamblers: count
    
    subscript(index: Int) -> Gambler {
        return listOfGamblers[index]
    }
    
    init(with numberOfGamblers: count) {
        self.numberOfGamblers = numberOfGamblers 
        var names = ["Sol", "Jee", "Eddy", "Jed", "Dale"]

        for _ in 0..<numberOfGamblers.count {
            let pickedIndex = (0..<names.count).randomElement() ?? 0
            let pickedName = names.remove(at: pickedIndex)
            let newGambler = Gambler(name: pickedName)
            listOfGamblers.append(newGambler)
        }
    }
    
    }
}
