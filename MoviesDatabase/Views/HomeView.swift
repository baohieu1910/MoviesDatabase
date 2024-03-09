//
//  HomeView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: TrendingMovieViewModel
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
                            
                            Color("DarkBlue")
                                .opacity(0.8)
                            
                            VStack(alignment: .leading) {
                                Text("Welcome.")
                                    .font(.system(size: 40))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("Millions of movies, TV shows and people to discover. Explore now.")
                                    .font(.system(size: 30))
//                                    .font(.custom("PlayfairDisplay-Bold", size: 30))
                                    .foregroundColor(.white)
                                
                                ZStack(alignment: .trailing) {
                                    TextField("    Search...", text: $searchKey)
                                        .frame(height: 50)
                                        .background(.white)
                                        .cornerRadius(90)
                                }
                                
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                        
                        ZStack {
                            BackgroundImage.getSecondHomeImage()
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 2 / 5, alignment: .center)
                                .clipped()
                            
                            Color.black
                                .opacity(0.7)
                            
                            VStack(alignment: .leading) {
                                LinearGradient(colors: [.mint, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .mask {
                                        Text("That's a Wrap 2023")
                                            .font(.system(size: 50))
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                
                                Text("The best (and worst) of the year from TMDB.")
                                    .font(.system(size: 20))
                                
                                Button {
                                    
                                } label : {
                                    ZStack {
                                        HStack {
                                            Text("Check it out")
                                                .font(.system(size: 15))
                                            Image(systemName: "arrow.right")
                                        }
                                        
                                        RoundedRectangle(cornerRadius: 90).stroke(lineWidth: 2)
                                            .frame(width: 160, height: 40)
                                    }
                                }
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                    }
                    
                    // MARK: Trending Movie
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Trending")
                                .font(.title2)
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
                    .foregroundColor(.black)
                    .padding()
                }
            }
            .navigationBarTitle("Home")
        }
        .onAppear {
            viewModel.getMoviesToday()
            viewModel.getMoviesThisWeek()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: TrendingMovieViewModel())
    }
}
