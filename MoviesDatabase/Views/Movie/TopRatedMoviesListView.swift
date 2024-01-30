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
            ScrollView {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(value: movie) {
                        MovieRowView(movie: movie)
                            .foregroundColor(.black)
                            .padding([.bottom, .horizontal])
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
            .navigationTitle("Top Rated Movies")
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
        .onAppear() {
            viewModel.getTopSeries()
        }
    }
}

struct TopRatedMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedMoviesListView(presentSideMenu: Binding.constant(false))
            .environmentObject(TopRatedMoviesViewModel())
    }
}
