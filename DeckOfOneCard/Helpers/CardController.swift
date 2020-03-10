//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Jake Haslam on 3/10/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import Foundation

class CardController {
    // URL Constents
    private static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1")
    //private static let
    static func fetchCard(comepletion: @escaping (Result<Card, CardError>) -> Void) {
        
        // 1 - Prepare URL
        guard let baseURL = baseURL else { return comepletion(.failure(.invalidURL)) }
        // 2 - Contact server
        URLSession.shared.dataTask(with: baseURL) {data, _, error in
            // 3 - Handle errors from the server
            if let error = error {
                print(error, error.localizedDescription)
                return comepletion(.failure(.thrown(error)))
            }
            // 4 - Check for json data
            guard let data = data else { return comepletion(.failure(.noData))}
            // 5 - Decode json into a Card
            do {
                let decoder = JSONDecoder()
                let card = try decoder.decode(Card.self, from: data)
                return comepletion(.success(card))
            } catch {
                print(error, error.localizedDescription)
                return comepletion(.failure(.thrown(error)))
            }
        }.resume()
    }
}
