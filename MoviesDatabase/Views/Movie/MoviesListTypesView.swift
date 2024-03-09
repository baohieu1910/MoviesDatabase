//
//  MoviesListTypesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct MoviesListTypesView: View {
    @ObservedObject var viewModel: SearchMovieViewModel
    @ObservedObject var popularVM = PopularMoviesViewModel()
    @ObservedObject var topRatedVM = TopRatedMoviesViewModel()
    @ObservedObject var nowPlayingVM = NowPlayingMoviesViewModel()
    @ObservedObject var upcomingVM = UpcomingMoviesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                if viewModel.searchText == "" {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Popular")
                                .font(.title)
                                .bold()
                            
                            PopularMoviesListView(viewModel: popularVM)
                                .frame(height: 300)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Top Rated")
                                .font(.title)
                                .bold()
                            
                            TopRatedMoviesListView(viewModel: topRatedVM)
                                .frame(height: 300)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Now Playing")
                                .font(.title)
                                .bold()
                            
                            NowPlayingMoviesListView(viewModel: nowPlayingVM)
                                .frame(height: 300)
                        }
                        .padding()
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("Upcoming")
                                .font(.title)
                                .bold()
                            
                            UpcomingMoviesListView(viewModel: upcomingVM)
                                .frame(height: 300)
                        }
                        .padding()
                    }
                } else {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailView(viewModel: MovieDetailViewModel(), movie: movie)
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(movie.title ?? "N/A")")
                                        .lineLimit(1)
                                    Divider()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        }
        .searchable(text: $viewModel.searchText)
        .onAppear {
            popularVM.getPopularMovie()
            topRatedVM.getTopSeries()
            nowPlayingVM.getNowPlayingMovies()
            upcomingVM.getUpcomingMovies()
        }
        .onChange(of: viewModel.searchText, perform: { newValue in
            viewModel.getSearchMovies(name: viewModel.searchText)
        })
    }
}

struct MoviesListTypesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListTypesView(viewModel: SearchMovieViewModel())
    }
}

