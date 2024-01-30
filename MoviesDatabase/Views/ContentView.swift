//
//  ContentView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                HomeView(presentSideMenu: $presentSideMenu)
                    .environmentObject(TrendingMovieViewModel())
                    .tag(0)
                
                PopularMoviesListView(presentSideMenu: $presentSideMenu)
                    .environmentObject(PopularMoviesViewModel())
                    .tag(1)
                
                TopRatedMoviesListView(presentSideMenu: $presentSideMenu)
                    .environmentObject(TopRatedMoviesViewModel())
                    .tag(2)
                
                NowPlayingMoviesListView(presentSideMenu: $presentSideMenu)
                    .environmentObject(NowPlayingMoviesViewModel())
                    .tag(3)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
        .background(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
