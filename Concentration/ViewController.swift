//
//  ViewController.swift
//  Concentration
//
//  Created by Eswar Kosuri on 2017-12-14.
//  Copyright © 2017 Eswar Kosuri. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairOfCards:(cardButtons.count+1)/2)
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips :\(flipCount)"
        }
    }
    
    @IBOutlet var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    

   @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
    
    
    if let cardNumber = cardButtons.index(of: sender){
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
        
    }
    else{print("chosen card was not in cardButtons")
    }
        
        
    }
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ?   #colorLiteral(red: 1, green: 0.5119704391, blue: 0.3258406133, alpha: 0) : #colorLiteral(red: 1, green: 0.5119704391, blue: 0.3258406133, alpha: 1)
            }
            
        }
    }
    var emojiChocices = ["🙃","🤟","🕍","🔦","🇮🇳","🏸","🙊","🍟","🏍"]
    var emoji = [Int:String]()
    func emoji(for card : Card)-> String{
        if emoji[card.identifier] == nil{
            if emojiChocices.count>0{
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChocices.count)))
                emoji[card.identifier] = emojiChocices.remove(at: randomIndex)
            }}
        return emoji[card.identifier] ?? "?"
    }
    
   }
        



