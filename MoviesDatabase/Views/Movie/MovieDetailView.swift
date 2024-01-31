//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI
import UIKit

struct MovieDetailView: View {
    @ObservedObject var viewModel: CastListViewModel
    @State var averageColor: Color = .black
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    // MARK: Movie Poster
                    ZStack(alignment: .leading) {
                        let backgroundUrl = URL(string: movie.getMovieBackground())
                        AsyncImage(url: backgroundUrl) { image in
                            ZStack {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .onAppear {
                                        averageColor = Color( image.averageColor ?? UIColor.black)
                                    }
                                
                                LinearGradient(gradient: Gradient(colors: [.clear, averageColor]), startPoint: .trailing, endPoint: .leading)
                                    .opacity(1)
                            }
                        } placeholder: {
                            Image("tmdb")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding()
                        }
                        
                        let posterUrl = URL(string: movie.getMoviePoster())
                        AsyncImage(url: posterUrl) { image in
                            ZStack {
                                image
                                    .resizable()
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                            
                        } placeholder: {
                            Image("tmdb")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding()
                        }
                    }
                    // MARK: Movie title
                    VStack {
                        VStack {
                            Text("\(movie.title)")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("(\(movie.getReleaseDate()))")
                                .font(.subheadline)
                        }
                        
                        HStack {
                            Spacer()
                            HStack {
                                CircularProcessBarView(progress: movie.voteAverage / 10)
                                
                                Text("User Score")
                                    .fontWeight(.bold)
                            }
                            Spacer()
                            Text("|")
                            Spacer()
                            HStack {
                                Image(systemName: "play.fill")
                                
                                Text("Play Trailer")
                            }
                            Spacer()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Overview")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("\(movie.overview)")
                        }
                    }
                    .padding()
                }
                .background(averageColor)
                .foregroundColor(.white)
            }
            
            // MARK: Cast
            VStack(alignment: .leading) {
                Text("Top Billed Cast")
                    .font(.title)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.casts) { cast in
                            NavigationLink {
                                CastDetailView(viewModel: PeopleViewModel(), cast: cast)
                            } label: {
                                CastCardView(cast: cast)
                            }
                            
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .onAppear {
                viewModel.getCastList(id: movie.id)
            }
            .foregroundColor(.black)
            
        }
//            VStack(alignment: .leading) {
//                Text("Original Title")
//
//                Text("Status")
//
//                Text("Original Language")
//
//                Text("Budget")
//
//                Text("Revenue")
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding()
    }
    
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: CastListViewModel(), movie: ExampleData.movie)
    }
}
