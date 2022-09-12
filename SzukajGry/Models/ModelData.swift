//
//  ModelData.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 07/09/2022.
//

import Foundation

var url = "https://www.cheapshark.com/"

var gamesMock = Result(games: [
    Game(title: "Forza Horizon 4", dealID: "43321", storeID: "2", salePrice: "55.55", thumb: "https://originassets.akamaized.net/origin-com-store-final-assets-prod/16274527/142.0x200.0/1121222_MB_142x200_en_WW_%5E_2021-11-18-14-34-53_d918ab679a85af5587bf001bc8b2f724b09ad93d.jpg",
         store: Store(storeID: "1", storeName: "Steam",
                      images: Images(icon: "/img/stores/icons/0.png", logo: "/img/stores/logos/0.png")
                     )
        ),
    Game(title: "Grand Theft Auto V: Premium Edition", dealID: "123", storeID: "1", salePrice: "12.34", thumb:
            "https://gamersgatep.imgix.net/0/d/c/d0cd7fdfd9b09b3ed092c7612baf88117233ccd0.jpg?auto=&w=",
         store: Store(storeID: "1", storeName: "Steam",
                      images: Images(icon: "/img/stores/icons/0.png", logo: "/img/stores/logos/0.png")
                     )),
])
