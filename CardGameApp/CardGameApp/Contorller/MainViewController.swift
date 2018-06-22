//
//  MainVC.swift
//  CardGameApp
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 Clover. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    private var deck: Deck = Deck()
    private var foundationViews: [UIImageView] = []
    private var deckView: UIImageView = UIImageView()
    private var stackView: [[UIImageView]] = []
    private var stackViewName: [[String]] = []
    private var openCard: UIImageView = UIImageView()
    
    override func setupView() {
        super.setupView()
        cardReset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapGestureToCardDeck()
    }
    
    
    
    private func makeFoundationView() {
        for _ in 1 ... 4 {
            let foundationview = Director.createFoundationView(ConcreateFoundationView())
            foundationViews.append(foundationview)
            view.addSubview(foundationview)
        }
    }
    
    private func makeDeckView() {
        deckView = Director.createCardView(ConcreateCardView())
        view.addSubview(deckView)
    }
    
    private func makeStackView() {
        for horizonNumber in 0 ... 6 {
            var verticalStack: [UIImageView] = []
            var verticalName: [String] = []
            for verticalNumber in 0 ... horizonNumber {
                let stackView = Director.createCardView(ConcreateCardView())
                verticalName.append(deck.removeOne().description)
                setStackView(horizonNumber, verticalNumber, stackView, verticalName[verticalNumber])
                verticalStack.append(stackView)
                view.addSubview(stackView)
            }
            stackViewName.append(verticalName)
            stackView.append(verticalStack)
        }
    }
    
    private func makeOpenView() {
        openCard = Director.createCardView(ConcreateCardView())
        view.addSubview(openCard)
        setOpenImage()
    }
    
    private func setOpenImage() {
        openCard.image = UIImage(named: deck.removeOne().description)
    }
    
    private func setStackView(_ horizonNumber: Int, _ verticalNumber: Int, _ stackView: UIImageView, _ stackCardName: String) {
        if horizonNumber == verticalNumber {
            stackView.image = UIImage(named: stackCardName)
        }
    }
    
    private func setLocationFoundationView() {
        for (index, foundationView) in foundationViews.enumerated() {
            foundationView.frame = ImageFrameMaker.makeLocationFoundationView(index)
        }
    }
    
    private func setLocationStackView() {
        for (horizonNumber, horizonStackView) in stackView.enumerated() {
            for (verticalNumber, verticalView) in horizonStackView.enumerated() {
                verticalView.frame = ImageFrameMaker.makeLocationStackView(horizonNumber, verticalNumber)
            }
        }
    }
    
    private func setLocationOpenView() {
        openCard.frame = ImageFrameMaker.makeLocationOpenView()
    }
    
    private func setTapGestureToCardDeck() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(deckTapped(sender:)))
        self.deckView.isUserInteractionEnabled = true
        self.deckView.addGestureRecognizer(tap)
    }
    
    @objc private func deckTapped(sender: UITapGestureRecognizer) {
        setOpenImage()
    }
    
    private func cardReset() {
        deck.reset()
        deck.shuffle()
        makeFoundationView()
        makeDeckView()
        makeStackView()
        makeOpenView()
        
        deckView.frame = ImageFrameMaker.makeLocationDeckView()
        setLocationFoundationView()
        setLocationStackView()
        setLocationOpenView()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            foundationViews.removeAll()
            stackView.removeAll()
            
            cardReset()
        }
    }
    
}
