//
//  MainVC.swift
//  CardGameApp
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 Clover. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    private let foundationField = FoundationCardView()
    private let deckField = DeckView()
    private let stackField = StackCardView()
    private var deck: Deck = Deck()
    
    override func setupView() {
        super.setupView()
        view.addSubViews(foundationField, deckField, stackField)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardReset()
    }
    
    private func makeStackCard() -> [[String]] {
        var stackCardNames: [[String]] = []
        
        for horizonNumber in 1 ... 7 {
            var verticalCardName: [String] = []
            for _ in 1 ... horizonNumber {
                verticalCardName.append(deck.removeOne().description)
            }
            stackCardNames.append(verticalCardName)
        }
        return stackCardNames
    }
    
    private func cardReset() {
        deck.shuffle()
        stackField.makelocationStackCard(makeStackCard())
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
           cardReset()
        }
    }
    
}
