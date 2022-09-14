//
//  StoreData.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 07/09/2022.
//

import Foundation

var stores = Stores(stores: nil)

func getStores() async {
    let url = URL(string: "https://www.cheapshark.com/api/1.0/stores")!
    
    var request = URLRequest(url: url)
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = try await URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            if let result = try? JSONDecoder().decode([Store].self, from: data) {
                stores.stores = result
            } else {
                print("Invalid Response")
            }
        } else if let error = error {
            print("HTTP Request Failed \(error)")
        }
    }
    
    task.resume()
}

func getStoreById(storeID: String) -> Store {
    let store: Store = (stores.stores?.filter{($0.storeID ?? "0") == storeID}.first)!
    
    return store
}
