//
//  ContentView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TopRatedMovieListView()
                .environmentObject(TopRatedMovieViewModel())
                .tabItem {
                    Image(systemName: "house.fill")
                }
            Text("User")
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
