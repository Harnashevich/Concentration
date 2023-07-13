//
//  ConcentrationViewController.swift
//  Concentration
//
//  Created by Andrei Harnashevich on 20.06.23.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
            return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5,
            .strokeColor: UIColor.black
        ]
        
        let attributedString = NSAttributedString(string:  "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: .normal)
                    button.backgroundColor = .lightGray
                } else {
                    button.setTitle("", for: .normal)
                    button.backgroundColor = card.isMatched ? .clear : .systemBlue
                }
            }
        }
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? String()
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    
    private var emojiChoices = "🦇😱🙀😈🎃👻🍭🍬🍎"
    private var emoji = [Card: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String (emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
}
