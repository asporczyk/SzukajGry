//
//  ModelData.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 07/09/2022.
//

import Foundation

var url = "https://www.cheapshark.com/"

var gamesMock = Result(games: [
    Game(title: "Forza Horizon 4",
         dealID: "1y%2FuTwcdqa9ejkiAhzTVQryMXaqZ17jq3vsxM%2BsJhUQ%3D",
         storeID: "1",
         isOnSale: "1",
         salePrice: "55.55",
         normalPrice: "59.99",
         savings: "3.000500",
         releaseDate: 1636416000,
         thumb: "https://cdn.cloudflare.steamstatic.com/steam/apps/1551360/capsule_sm_120.jpg?t=1661275467",
         store: Store(storeID: "1", storeName: "Steam",
                      images: Images(icon: "/img/stores/icons/0.png", logo: "/img/stores/logos/0.png")
                     )
        ),
    Game(title: "Grand Theft Auto V: Premium Edition",
         dealID: "123",
         storeID: "1",
         isOnSale: "1",
         salePrice: "55.55",
         normalPrice: "59.99",
         savings: "3.0",
         releaseDate: 1636416000,
         thumb:
            "https://gamersgatep.imgix.net/0/d/c/d0cd7fdfd9b09b3ed092c7612baf88117233ccd0.jpg?auto=&w=",
         store: Store(storeID: "1", storeName: "Steam",
                      images: Images(icon: "/img/stores/icons/0.png", logo: "/img/stores/logos/0.png")
                     )),
])
