//
//  NowPlayingMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct NowPlayingMoviesListView: View {
    @Binding var presentSideMenu: Bool
    @ObservedObject var viewModel: NowPlayingMoviesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.movies) { movie in
                    NavigationLink {
                        MovieDetailView(castVM: CastListViewModel(), movieVM: MovieDetailViewModel(), movie: movie)
                    } label: {                 
                        MovieRowView(movie: movie)
                            .foregroundColor(.black)
                            .padding([.bottom, .horizontal])
                    }
                }
            }
            .navigationTitle("Now Playing Movies")
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
            viewModel.getNowPlayingMovies()
        }
    }
}

struct NowPlayingMoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingMoviesListView(presentSideMenu: Binding.constant(false), viewModel: NowPlayingMoviesViewModel())
    }
}
