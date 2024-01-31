//
//  HomeView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var presentSideMenu: Bool
    @EnvironmentObject var viewModel: TrendingMovieViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
//                VStack(alignment: .leading) {
//                    Text("Welcome.")
//                        .font(.title)
//                        .fontWeight(.bold)
//
//                    Text("Millions of movies, TV shows and people to discover. Explore now.")
//                        .font(.title2)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
                
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.moviesToday) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                        .environmentObject(CastListViewModel())
                                } label: {
                                    MovieCardView(movie: movie)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding()
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
        .onAppear {
            viewModel.getMoviesToday()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: Binding.constant(false))
            .environmentObject(TrendingMovieViewModel())
    }
}
