//
//  DetailsView.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 12/09/2022.
//

import SwiftUI

func getDateString(from timeInterval: TimeInterval) -> String{
    let date = Date(timeIntervalSince1970: timeInterval)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    return dateFormatter.string(from: date)
}

func getRoundedNumber(from number: String) -> String{
    var percentage = Double(number)
    percentage = percentage?.rounded()
    let intPercentage = Int(percentage ?? 0)
    return "\(intPercentage)"
}

struct DetailsView: View {
    var game: Game
    var dealUrl = "https://www.cheapshark.com/redirect?dealID="
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: game.thumb!), content: { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(maxWidth: .infinity, maxHeight: 120)
            }, placeholder: {
                ProgressView()
            })
            .frame(width: .infinity, height: 200)
            Text(game.title!)
                .font(.largeTitle)
                .padding()
            Spacer()
            if (game.releaseDate != 0) {
                Text("Data wydania: \(getDateString(from:game.releaseDate))")
                    .padding()
                    .font(.title3)
            }
            Spacer()
            HStack{
                Text("Cena:")
                    .font(.title2)
                    .bold()
                if(game.isOnSale == "1"){
                    HStack{
                        Text(game.normalPrice! + "$")
                            .font(.title2)
                            .strikethrough()
                        Text("➡️")
                            .font(.title2)
                        Text(game.salePrice! + "$")
                            .font(.title2)
                    }
                } else if(game.isOnSale == "0"){
                    Text(game.normalPrice! + "$")
                        .font(.title2)
                }
            }
            
            if(game.isOnSale == "1"){
                Text("Oszczędzasz \(getRoundedNumber(from: game.savings!))%")
                    .font(.headline)
                    .padding()
            }
            
            Spacer()
            
            Button{
                openURL(URL(string: dealUrl+game.dealID!)!)
            } label: {
                HStack{
                    AsyncImage(url: URL(string: url+(game.store?.images?.logo)!), content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 50, maxHeight: 50)
                    }, placeholder: {
                        ProgressView()
                    })
                        .frame(maxWidth: 50, maxHeight: 50)
                        Spacer()
                    Text("Zobacz ofertę na "+(game.store?.storeName)!)
                        .font(.title2)
                        .foregroundColor(.white)
                                
                }
                .padding()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .navigationTitle("Szczegóły gry")
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(game: gamesMock.games![0])
    }
}
