//
//  HomeView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = TrendingMovieViewModel()
    @State private var searchKey: String = ""
    
    private let types = ["Today", "This Week"]
    @State private var type = "Today"
    
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    // MARK: Background Image
                    VStack(spacing: 0) {
                        
                        ZStack {
                            BackgroundImage.getFirstHomeImage()
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 2 / 5, alignment: .center)
                                .clipped()
                            
                            Color(.black)
                                .opacity(0.6)
                            
                            LinearGradient(colors: [.clear, .clear, .black], startPoint: .top, endPoint: .bottom)
                            
                            VStack(alignment: .leading) {
                                Text("Welcome.")
                                    .font(.custom("PlayfairDisplay-Bold", size: 40))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("Millions of movies, TV shows and people to discover.")
                                    .font(.custom("PlayfairDisplay-Bold", size: 30))
                                    .foregroundColor(.white)
                                
                                Text("Explore now.")
                                    .font(.custom("PlayfairDisplay-Bold", size: 30))
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                    }
                    
                    // MARK: Trending Movie
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Trending")
                                .font(.custom("PlayfairDisplay-Bold", size: 30))
                                .fontWeight(.bold)
                            
                            Picker("Type", selection: $type) {
                                ForEach(types, id:\.self) { type in
                                    Text("\(type)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(type == "Today" ? viewModel.moviesToday : viewModel.moviesThisWeek) { movie in
                                    NavigationLink {
                                        MovieDetailView(viewModel: MovieDetailViewModel(), movie: movie)
                                    } label: {
                                        MovieCardView(movie: movie)
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.getMoviesToday()
            viewModel.getMoviesThisWeek()
        }
           
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.colorScheme, .dark)
    }
}
