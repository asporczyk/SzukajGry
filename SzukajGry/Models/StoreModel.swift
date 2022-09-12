//
//  StoreModel.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 07/09/2022.
//

import Foundation

struct Images: Decodable {
    var icon: String?
    var logo: String?
}

struct Store: Decodable {
    var storeID: String?
    var storeName: String?
    var images: Images?
}
