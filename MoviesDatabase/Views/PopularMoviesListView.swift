//
//  PopularMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct PopularMoviesListView: View {
    @Binding var presentSideMenu: Bool
    @EnvironmentObject var viewModel: PopularMoviesViewModel
    
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
//                        viewModel.getPopularMovie()
//                    } label: {
//                        Text("Load More")
//                    }
//                }
                
            }
            .onAppear() {
                viewModel.getPopularMovie()
            }
//            .listStyle(.sidebar)
            .navigationTitle("Popular Movies")
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

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesListView(presentSideMenu: Binding.constant(false))
            .environmentObject(PopularMoviesViewModel())
    }
}
