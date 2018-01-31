//
//  ViewController.swift
//  CardGameApp
//
//  Created by Mrlee on 2018. 1. 26..
//  Copyright © 2018년 Napster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var deck: Deck!
    private var gameTable: Table!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackGround()
        self.deck = Deck()
        self.gameTable = Table(with: self.deck)
        makeGameTable()
    }
    
    func makeGameTable() {
        makeTableColumnCards()
        makeFoundation()
        makeDeck()
    }
    
    private func makeBackGround() {
        guard let tableBackground = UIImage(named: "cg_background") else { return }
        self.view.backgroundColor = UIColor(patternImage: tableBackground)
    }
    
    private func makeFoundation() {
        for column in 0..<4 {
            let cardPlace = UIImageView()
            cardPlace.makeCardView(index: CGFloat(column))
            self.view.addSubview(cardPlace)
        }
    }
    
    private func makeTableColumnCards() {
        self.deck = try? self.gameTable.dealTheCardOfGameTable()
        let tableStacks = makeColumnView()
        var column = 0
        for cardView in tableStacks {
            for index in 0..<cardView.count {
                cardView[index].makeStackView(column: column, cardsRow: index)
                self.view.addSubview(cardView[index])
            }
            column += 1
        }
    }
    
    private func makeColumnView() -> [[UIImageView]] {
        var cardStackView = [[UIImageView]]()
        for cards in gameTable.cardStacksOfTable {
            cardStackView.append(makeCardStacks(cards: cards))
        }
        return cardStackView
    }
    
    private func makeCardStacks(cards: [Card]) -> [UIImageView] {
        var stacks = [UIImageView]()
        for card in cards {
            stacks.append(choiceCardFace(with: card) )
        }
        return stacks
    }
    
    private func choiceCardFace(with card: Card) -> UIImageView {
        var cardView = UIImageView()
        if card.isUpside() {
            cardView = UIImageView(image: UIImage(named: card.getCardName()))
        } else {
            cardView = UIImageView(image: UIImage(named: "card_back"))
        }
        return cardView
    }
    
    private func makeDeck() {
        guard let restOfcardCover = deck.getRestDeck().last else { return }
        let lastColumn = 6
        if !restOfcardCover.isUpside() {
            let backSide = UIImageView(image: UIImage(named: "card_back"))
            backSide.makeCardView(index: CGFloat(lastColumn))
            let gesture = UITapGestureRecognizer(target: self,
                                                 action: #selector (popCard(_:)))
            backSide.addGestureRecognizer(gesture)
            backSide.isUserInteractionEnabled = true
            backSide.tag = 1
            self.view.addSubview(backSide)
        }
    }
    
    @objc private func popCard(_ touch: UITapGestureRecognizer) {
        if touch.state == .ended {
            if let oneCard = deck.popCard() {
                oneCard.flipCard()
                let cardView = UIImageView(image: UIImage(named: oneCard.getCardName()))
                cardView.makeCardView(index: 4.5)
                self.view.addSubview(cardView)
            } else if deck.isEmptyDeck() {
               makeRefreshButtonView()
            }
        }
    }
    
    private func makeRefreshButtonView() {
        let button = UIImageView(image: UIImage(named: "cardgameapp-refresh-app"))
        button.refreshButton()
        if let deckCoverView = self.view.viewWithTag(1) {
            deckCoverView.removeFromSuperview()
        }
        self.view.addSubview(button)
    }
}

extension ViewController {
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        if motion == .motionShake {
            self.deck = Deck()
            self.gameTable = Table(with: self.deck)
            self.view.subviews.forEach { $0.removeFromSuperview() }
            makeGameTable()
        }
    }
}
