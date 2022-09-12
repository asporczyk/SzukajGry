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
        Game(title: "Forza Horizon 4", dealID: "43321", storeID: "2", salePrice: "55.55", thumb: "https://cdn.cloudflare.steamstatic.com/steam/apps/1293830/capsule_sm_120.jpg?t=1622068013",
             store: Store(storeID: "1", storeName: "Steam",
                          images: Images(icon: url+"/img/stores/icons/0.png", logo: url+"/img/stores/logos/0.png")
                         )
            ),
        ]
)
}
