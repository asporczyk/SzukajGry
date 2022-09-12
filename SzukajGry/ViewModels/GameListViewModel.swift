//
//  GaneListViewModel.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 08/09/2022.
//

import Foundation
import SwiftUI

class GameListViewModel: ObservableObject{

    @Published var gamesData = Result(games: nil)
    @Published var isSearching = false

    @MainActor
    func searchGame(title: String) async {
        isSearching = true
        let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?title=\(title)")!
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = try await URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let result = try? JSONDecoder().decode([Game].self, from: data) {
                    self.gamesData.games = result
                    //print(self.gamesData)
                    
                    for game in self.gamesData.games! {
                        print(game)
                    }
                    
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        
        
        
        task.resume()
    
        
        isSearching = false
    }
    
}
