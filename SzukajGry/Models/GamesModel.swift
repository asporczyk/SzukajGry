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
        Game(title: "Forza Horizon 4",
             dealID: "1y%2FuTwcdqa9ejkiAhzTVQryMXaqZ17jq3vsxM%2BsJhUQ%3D",
             storeID: "1",
             isOnSale: "1",
             salePrice: "55.55",
             normalPrice: "59.99",
             savings: "3.0",
             releaseDate: 1636416000,
             thumb: "https://originassets.akamaized.net/origin-com-store-final-assets-prod/16274527/142.0x200.0/1121222_MB_142x200_en_WW_%5E_2021-11-18-14-34-53_d918ab679a85af5587bf001bc8b2f724b09ad93d.jpg",
             store: Store(storeID: "1", storeName: "Steam",
                          images: Images(icon: "/img/stores/icons/0.png", logo: "/img/stores/logos/0.png")
                         )
            ),
        ]
)
}
