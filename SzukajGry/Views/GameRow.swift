//
//  GameRow.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 07/09/2022.
//

import SwiftUI


struct GameRow: View {
    var game: Game
    var url = "https://www.cheapshark.com/"
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: game.thumb!), content: { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(maxWidth: 120, maxHeight: 80)
                }, placeholder: {
                    ProgressView()
                })
                .frame(width: 120, height: 120)
                Spacer()
                Text(game.title!)
                    .font(.title)
            }
            HStack {
                HStack{
                    AsyncImage(url: URL(string: url+(game.store?.images?.icon)!), content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 20, maxHeight: 20)
                    }, placeholder: {
                        ProgressView()
                    })
                        .frame(maxWidth: 20, maxHeight: 20)
                Text((game.store?.storeName)!)
                    .font(.title2)
                }
                Spacer()
                Text(game.salePrice!+"$")
                    .font(.title2)
            }
        }
        .frame(height: 200)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: gamesMock.games![0])
    }
}
