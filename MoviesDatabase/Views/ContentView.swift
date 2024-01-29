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
                PopularMoviesListView(presentSideMenu: $presentSideMenu)
                    .environmentObject(PopularMoviesViewModel())
                    .tag(0)
                
                TopRatedMoviesListView(presentSideMenu: $presentSideMenu)
                    .environmentObject(TopRatedMoviesViewModel())
                    .tag(1)
                
                NowPlayingMoviesListView(presentSideMenu: $presentSideMenu)
                    .environmentObject(NowPlayingMoviesViewModel())
                    .tag(2)
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
            
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
