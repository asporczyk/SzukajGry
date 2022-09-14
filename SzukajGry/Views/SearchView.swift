//
//  ContentView.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 06/09/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var title: String = ""
    @State private var isShowingView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Witaj")
                    .font(.largeTitle)
                    .padding()
                Text("Wpisz tytuł gry poniżej, aby sprawdzić jego ceny w różnych sklepach")
                    .padding()
                    .font(.title3)
                Spacer()
                TextField("Podaj tytuł gry...",
                    text: $title
                    )
                .frame(height: 55)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .padding([.horizontal], 24)
                Spacer()
                Button{
                    self.isShowingView = true
                } label: {
                    Text("Wyszukaj gry")
                        .font(.title3)
                        .padding()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                NavigationLink(destination: GamesListView(title: title), isActive: $isShowingView) { EmptyView() }
                }
            .task {
                await getStores()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
