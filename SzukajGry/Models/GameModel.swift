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
    var salePrice: String?
    var thumb: String?
    var store: Store?
}
