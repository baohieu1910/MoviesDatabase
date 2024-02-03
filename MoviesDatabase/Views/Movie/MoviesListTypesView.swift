//
//  MoviesListTypesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct MoviesListTypesView: View {
    @State private var type = "Popular"
    private let types = ["Popular", "Now Playing", "Top Rated", "Upcoming"]
    
    var body: some View {
        VStack {
            Picker("Types", selection: $type) {
                ForEach(types, id: \.self) { type in
                    Text("\(type)")
                }
            }.pickerStyle(.segmented)
            
            if type == types[0] {
                PopularMoviesListView(viewModel: PopularMoviesViewModel())
            } else if type == types[1] {
                NowPlayingMoviesListView(viewModel: NowPlayingMoviesViewModel())
            } else if type == types[2] {
                TopRatedMoviesListView(viewModel: TopRatedMoviesViewModel())
            } else if type == types[3] {
                UpcomingMoviesListView(viewModel: UpcomingMoviesViewModel())
            }
            
        }
    }
}

struct MoviesListTypesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListTypesView()
    }
}

