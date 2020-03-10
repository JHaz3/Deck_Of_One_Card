//
//  Deck.swift
//  DeckOfOneCard
//
//  Created by Jake Haslam on 3/10/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

struct Card: Codable {
    let image: URL
    let value: String
    let suit: String
}

struct TopLevelObject: Codable {
    
let cards: [Card]

}
