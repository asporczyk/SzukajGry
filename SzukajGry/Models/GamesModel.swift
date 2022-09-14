//
//  GamesModel.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 07/09/2022.
//

import Foundation

struct Result: Decodable {
    var games: [Game]?
}

extension Result{
    static let empty = Result(games: [
        Game(title: "",
             dealID: "",
             storeID: "1",
             isOnSale: "",
             salePrice: "",
             normalPrice: "",
             savings: "",
             releaseDate: 0,
             thumb: "",
             store: nil
            ),
        ]
)
}
