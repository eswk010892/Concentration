//
//  Concentration.swift
//  Concentration
//
//  Created by Eswar Kosuri on 2017-12-15.
//  Copyright © 2017 Eswar Kosuri. All rights reserved.
//

import Foundation
class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFacedUpCard,matchIndex != index{
                //check on match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = nil
                
            }
            else{
                //else no cards or 2cards
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
            
        }
        
    }
    init(numberOfPairOfCards:Int) {
        for _ in 1...numberOfPairOfCards{
            let card = Card()
          cards += [card,card]
        }
        //TODO:shuffle the cards
    }
}

