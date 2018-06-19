//
//  CARDGAMEAPP.swift
//  CardGameApp
//
//  Created by Jung seoung Yeo on 2018. 6. 14..
//  Copyright © 2018년 Clover. All rights reserved.
//
import UIKit

enum CARDGAMEAPP {
    enum LAYOUT {
        case horizonCardCount
        case width
        case cardRatio
        case margin
        case top
        
        var rawValue: CGFloat {
            switch self {
            case .horizonCardCount:
                return 7
            case .cardRatio:
                return 1.27
            case .width:
                return (UIScreen.main.bounds.width / CARDGAMEAPP.LAYOUT.horizonCardCount.rawValue) - ((UIScreen.main.bounds.width / CARDGAMEAPP.LAYOUT.horizonCardCount.rawValue)) / 20
            case .margin:
                return CARDGAMEAPP.LAYOUT.width.rawValue / 30
            case .top:
                return 20
            }
        }
    }
}
