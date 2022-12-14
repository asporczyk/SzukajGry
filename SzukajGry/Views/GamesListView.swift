//
//  GamesListView.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 07/09/2022.
//

import SwiftUI

struct GamesListView: View {
    @State var title: String
    @State var isSearching = false
    @State var games = [Game]()
    
    private func buildURLRequest(for term: String) -> URLRequest {
        let escapedSearchTerm = term.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let url = URL(string: "https://www.cheapshark.com/api/1.0/deals?title=\(escapedSearchTerm)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
      }
    
    func search(for term: String) async -> [Game] {
        isSearching = true
        let request = buildURLRequest(for: term)
        
        do {
          let (data, response) = try await URLSession.shared.data(for: request)
          guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
              return Result.empty.games!
          }
            let result = try JSONDecoder().decode([Game].self, from: data)
            isSearching = false
            return result
        }
        catch {
            return Result.empty.games!
        }
      }
    
    var body: some View {
        ZStack {
            if isSearching {
                ProgressView()
            } else {
                
                List (games, id: \.dealID){ game in
                    NavigationLink{
                        DetailsView(game: game)
                    } label: {
                        GameRow(game: game)
                    }
                }
            }
        }
        .task {
            let result = await search(for: title)
            games = result
            
            for i in 0..<games.count {
                self.games[i].store = getStoreById(storeID: games[i].storeID!)
            }
        }
        .refreshable {
            let result = await search(for: title)
            games = result
            
            for i in 0..<games.count {
                self.games[i].store = getStoreById(storeID: games[i].storeID!)
            }
        }
        .navigationTitle("Wyniki wyszukiwania")
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView(title: "Forza")
    }
}
