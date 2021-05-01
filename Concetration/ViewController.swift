//
//  ViewController.swift
//  Concetration
//
//  Created by Saber on 18/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    var flibCount = 0{
        didSet{
            flibCountLabel.text = "Flibs : \(flibCount)"
        }
    }
    @IBOutlet weak var flibCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
   lazy var game = Concetration(numberOFPairsOfCards: self.cardButtons.count / 2)
    
    var emojiChoices = ["🔥","👻"]
    var emoji = [Int: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flibCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUP{
                print("here")
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            }
        }
    }
    func emoji(for card: Card)-> String{
        if emoji[card.idenifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.idenifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.idenifier] ?? "?"
        
    }
    
    

}

