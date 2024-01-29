//
//  TopRatedMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct TopRatedMoviesListView: View {
    @Binding var presentSideMenu: Bool
    @EnvironmentObject var viewModel: TopRatedMoviesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(value: movie) {
                        MovieRowView(movie: movie)
                    }
                }
//                VStack {
//                    Button {
//                        viewModel.getTopSeries()
//                    } label: {
//                        Text("Load More")
//                    }
//                }
            }
            .onAppear() {
                viewModel.getTopSeries()
            }
            .navigationTitle("Top \(viewModel.movies.count) Rated Movies")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
                    .environmentObject(CastListViewModel())
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image("menu")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
            }
            
            
        }
    }
}

struct TopRatedMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedMoviesListView(presentSideMenu: Binding.constant(false))
            .environmentObject(TopRatedMoviesViewModel())
    }
}
