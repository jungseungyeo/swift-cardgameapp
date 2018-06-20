//
//  StackCardView.swift
//  CardGameApp
//
//  Created by Jung seoung Yeo on 2018. 6. 16..
//  Copyright © 2018년 Clover. All rights reserved.
//

import UIKit

class StackCardView: BaseView {
    
    private let stackField: ConcreateCardView = ConcreateCardView()
    private var stackCards: [[UIImageView]] = []
    
    override func setupView() {
        super.setupView()
        makeStackCard()
    }
    
    private func makeStackCard() {
        for horizonNumber in 1 ... 7 {
            var verticalCards: [UIImageView] = []
            for _ in 1 ... horizonNumber {
                verticalCards.append(directorView.createCardView(stackField))
            }
            stackCards.append(verticalCards)
        }
        
    }
    
    func makelocationStackCard(_ stackCardNames: [[String]]) {
        for (horizonNumber, verticalStackNames) in stackCardNames.enumerated() {
            makeVerticalCardStackView(horizonNumber, verticalStackNames: verticalStackNames)
        }
    }
    
    private func makeVerticalCardStackView(_ horizonNumber: Int, verticalStackNames: [String]) {
        for (verticalNumber, stackCardName) in verticalStackNames.enumerated() {
            addSubview(stackCards[horizonNumber][verticalNumber])
            setCardImage(horizonNumber, verticalNumber, stackCardName)
            stackCards[horizonNumber][verticalNumber].frame = CGRect(x: (CARDGAMEAPP.LAYOUT.width.rawValue / CARDGAMEAPP.LAYOUT.horizonCardCount.rawValue) +
                ((CARDGAMEAPP.LAYOUT.width.rawValue + CARDGAMEAPP.LAYOUT.margin.rawValue) * CGFloat(horizonNumber)),
                                                                     y: CARDGAMEAPP.LAYOUT.top.rawValue + CARDGAMEAPP.LAYOUT.width.rawValue * CARDGAMEAPP.LAYOUT.cardRatio.rawValue + CARDGAMEAPP.LAYOUT.margin.rawValue + CGFloat(verticalNumber) * 20,
                                                                     width: CARDGAMEAPP.LAYOUT.width.rawValue,
                                                                     height: CARDGAMEAPP.LAYOUT.width.rawValue * CARDGAMEAPP.LAYOUT.cardRatio.rawValue)
        }
    }
    
    private func setCardImage(_ horizonNumber: Int, _ verticalNumber: Int, _ stackCardName: String) {
        if horizonNumber == verticalNumber {
            stackCards[horizonNumber][verticalNumber].image = UIImage(named: stackCardName)
        }
    }
}
