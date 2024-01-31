//
//  TopRatedMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct TopRatedMoviesListView: View {
    @Binding var presentSideMenu: Bool
    @ObservedObject var viewModel: TopRatedMoviesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.movies) { movie in
                    NavigationLink {
                        MovieDetailView(viewModel: CastListViewModel(), movie: movie)
                    } label: {
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
        TopRatedMoviesListView(presentSideMenu: Binding.constant(false), viewModel: TopRatedMoviesViewModel())
    }
}
