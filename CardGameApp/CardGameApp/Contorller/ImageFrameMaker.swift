//
//  LocationViewController.swift
//  CardGameApp
//
//  Created by Jung seoung Yeo on 2018. 6. 21..
//  Copyright © 2018년 Clover. All rights reserved.
//

import UIKit

class ImageFrameMaker {
    static func makeLocationFoundationView(_ horizonNumber: Int) -> CGRect {
        return CGRect(x: (CARDGAMEAPP.LAYOUT.width.rawValue / CARDGAMEAPP.LAYOUT.horizonCardCount.rawValue) + ((CARDGAMEAPP.LAYOUT.width.rawValue + CARDGAMEAPP.LAYOUT.margin.rawValue) * CGFloat(horizonNumber)),
                      y: CARDGAMEAPP.LAYOUT.top.rawValue,
                      width: CARDGAMEAPP.LAYOUT.width.rawValue,
                      height: CARDGAMEAPP.LAYOUT.width.rawValue * CARDGAMEAPP.LAYOUT.cardRatio.rawValue)
    }
    
    static func makeLocationDeckView() -> CGRect {
        return CGRect(x: UIScreen.main.bounds.width - CARDGAMEAPP.LAYOUT.width.rawValue - CARDGAMEAPP.LAYOUT.margin.rawValue,
                                        y: CARDGAMEAPP.LAYOUT.top.rawValue,
                                        width: CARDGAMEAPP.LAYOUT.width.rawValue,
                                        height: CARDGAMEAPP.LAYOUT.width.rawValue * CARDGAMEAPP.LAYOUT.cardRatio.rawValue)
    }
    
    static func makeLocationStackView(_ horizonNumber: Int, _ verticalNumber: Int) -> CGRect {
        return CGRect(x: (CARDGAMEAPP.LAYOUT.width.rawValue / CARDGAMEAPP.LAYOUT.horizonCardCount.rawValue) +
                ((CARDGAMEAPP.LAYOUT.width.rawValue + CARDGAMEAPP.LAYOUT.margin.rawValue) * CGFloat(horizonNumber)),
                                                                     y: CARDGAMEAPP.LAYOUT.top.rawValue + CARDGAMEAPP.LAYOUT.width.rawValue * CARDGAMEAPP.LAYOUT.cardRatio.rawValue + CARDGAMEAPP.LAYOUT.margin.rawValue + CGFloat(verticalNumber) * 20,
                                                                     width: CARDGAMEAPP.LAYOUT.width.rawValue,
                                                                     height: CARDGAMEAPP.LAYOUT.width.rawValue * CARDGAMEAPP.LAYOUT.cardRatio.rawValue)
    }
    
    static func makeLocationOpenView() -> CGRect {
        return CGRect(x: (CARDGAMEAPP.LAYOUT.width.rawValue / CARDGAMEAPP.LAYOUT.horizonCardCount.rawValue) + ((CARDGAMEAPP.LAYOUT.width.rawValue + CARDGAMEAPP.LAYOUT.margin.rawValue) * CGFloat(5)),
                       y: CARDGAMEAPP.LAYOUT.top.rawValue,
                      width: CARDGAMEAPP.LAYOUT.width.rawValue,
                      height: CARDGAMEAPP.LAYOUT.width.rawValue * CARDGAMEAPP.LAYOUT.cardRatio.rawValue)
    }
}
