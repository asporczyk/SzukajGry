//
//  GameModel.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 07/09/2022.
//

import Foundation
import SwiftUI

struct Game: Decodable {
    var title: String?
    var dealID: String?
    var storeID: String?
    var isOnSale: String?
    var salePrice: String?
    var normalPrice: String?
    var savings: String?
    var releaseDate: TimeInterval
    var thumb: String?
    var store: Store?
}
