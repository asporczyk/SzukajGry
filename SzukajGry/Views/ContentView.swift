//
//  ContentView.swift
//  SzukajGry
//
//  Created by Adam Sporczyk on 06/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var title: String = ""
    @State private var isShowingView = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Podaj tytuł gry...",
                    text: $title
                    )
                .padding(.all, 30)
                .textFieldStyle(.roundedBorder)
                
                Button("Szukaj gry") {
                    self.isShowingView = true
                }
                .padding()
                .buttonStyle(.borderedProminent)
                
                NavigationLink(destination: GamesListView(title: title), isActive: $isShowingView) { EmptyView() }
                }
            }
        .navigationTitle("Navigation")
        .task {
            await getStores()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
