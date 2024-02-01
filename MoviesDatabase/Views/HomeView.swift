//
//  HomeView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var presentSideMenu: Bool
    @ObservedObject var viewModel: TrendingMovieViewModel
    @State private var searchKey: String = ""
    
    private let types = ["Today", "This Week"]
    @State private var type = "Today"
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // MARK: Background Image
                    VStack(spacing: 0) {
                        let firstUrl = URL(string: BackgroundImage.firstHomeImage)
                        AsyncImage(url: firstUrl) { image in
                            ZStack {
                                image
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
                                        .foregroundColor(.white)
                                    
                                    ZStack(alignment: .trailing) {
                                        TextField("    Search...", text: $searchKey)
                                            .frame(height: 50)
                                            .background(.white)
                                            .cornerRadius(90)
                                            
//                                        Button {
//                                            // Search
//                                        } label: {
//                                            LinearGradient(colors: [.mint, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
//                                                .mask {
//                                                    RoundedRectangle(cornerRadius: 90).stroke(lineWidth: 2)
//                                                        .frame(width: 160, height: 40, alignment: .trailing)
//                                                }
//                                        }
                                    }
                                    
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                            
                            
                        } placeholder: {
                            ProgressView()
                        }
                        
                        let secondUrl = URL(string: BackgroundImage.secondHomeImage)
                        AsyncImage(url: secondUrl) { image in
                            ZStack {
                                image
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
                            
                            
                        } placeholder: {
                            ProgressView()
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
                                        MovieDetailView(viewModel: CastListViewModel(), movie: movie)
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
        HomeView(presentSideMenu: Binding.constant(false), viewModel: TrendingMovieViewModel())
    }
}
