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
                ZStack {
                    Image("Movie")
                        .resizable()
                        .scaledToFit()
                        .scaledToFill()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                    
                    LinearGradient(colors: [.clear, .clear, .white], startPoint: .top, endPoint: .bottom)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Search your movie", text: $viewModel.searchText)
                                .padding(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 90)
                                        .stroke(.gray)
                                }
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Welcome.")
                            .font(.custom("PlayfairDisplay-Bold", size: 50))
                        
                        Text("Millions of movies to discover.")
                            .font(.custom("PlayfairDisplay-Bold", size: 30))
                        
                        Text("Explore now.")
                            .font(.custom("PlayfairDisplay-Bold", size: 30))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                }
                
                if viewModel.searchText == "" {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Popular")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                            
                            PopularMoviesListView(viewModel: popularVM)
                                .frame(height: 250)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Top Rated")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                            
                            TopRatedMoviesListView(viewModel: topRatedVM)
                                .frame(height: 250)
                        }
                        .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Now Playing")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                            
                            NowPlayingMoviesListView(viewModel: nowPlayingVM)
                                .frame(height: 250)
                        }
                        .padding()
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("Upcoming")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                            
                            UpcomingMoviesListView(viewModel: upcomingVM)
                                .frame(height: 250)
                        }
                        .padding()
                    }
                } else {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailView(viewModel: MovieDetailViewModel(), movie: movie)
                        } label: {
                            VStack {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("\(movie.title ?? "N/A")")
                                            .lineLimit(1)
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                Divider()
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
            
        }
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

