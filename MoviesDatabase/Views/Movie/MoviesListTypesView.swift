//
//  MoviesListTypesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct MoviesListTypesView: View {
    @ObservedObject var viewModel: SearchMovieViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.searchText == "" {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Popular")
                                .font(.title)
                                .bold()
                            
                            PopularMoviesListView(viewModel: PopularMoviesViewModel())
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Top Rated")
                                .font(.title)
                                .bold()
                            
                            TopRatedMoviesListView(viewModel: TopRatedMoviesViewModel())
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Now Playing")
                                .font(.title)
                                .bold()
                            
                            NowPlayingMoviesListView(viewModel: NowPlayingMoviesViewModel())
                        }
                        .padding()
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("Upcoming")
                                .font(.title)
                                .bold()
                            
                            UpcomingMoviesListView(viewModel: UpcomingMoviesViewModel())
                        }
                        .padding()
                    }
                } else {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailView(castVM: CastMovieListViewModel(), movieVM: MovieDetailViewModel(), imageVM: ImagesViewModel(), movie: movie)
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

