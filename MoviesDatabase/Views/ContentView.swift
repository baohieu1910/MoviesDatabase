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
                HomeView(presentSideMenu: $presentSideMenu, viewModel: TrendingMovieViewModel())
                    .tag(0)
                
                PopularMoviesListView(presentSideMenu: $presentSideMenu, viewModel: PopularMoviesViewModel())
                    .tag(1)
                
                TopRatedMoviesListView(presentSideMenu: $presentSideMenu, viewModel: TopRatedMoviesViewModel())
                    .tag(2)
                
                NowPlayingMoviesListView(presentSideMenu: $presentSideMenu, viewModel: NowPlayingMoviesViewModel())
                    .tag(3)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
