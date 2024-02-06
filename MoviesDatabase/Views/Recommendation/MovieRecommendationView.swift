//
//  MovieRecommendationView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/7/24.
//

import SwiftUI

struct MovieRecommendationView: View {
    @ObservedObject var viewModel: MovieRecommendationViewModel
    var movie: Movie
    
    var body: some View {
        VStack {
            if viewModel.movies == [] {
                Text("We don't have enough data to suggest any movies based on \(movie.title  ?? "N/A"). You can help by rating movies you've seen.")
                    .padding(.horizontal)
                    .foregroundColor(.black)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.movies) { movie in
                            let url = URL(string: Utils.getMovieBackground(backdropPath: movie.backdropPath))
                            AsyncImage(url: url) { image in
                                NavigationLink {
                                    MovieDetailView(viewModel: MovieDetailViewModel(), movie: movie)
                                } label: {
                                    VStack(alignment: .leading) {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 250, height: 150, alignment: .center)
                                            .clipped()
                                            .cornerRadius(10)
                                        
                                        HStack {
                                            Text("\(movie.title ?? "N/A")")
                                                .lineLimit(1)
                                            
                                            Spacer()
                                            
                                            Text("\(Int((movie.voteAverage ?? 0) * 10))%")
                                        }
                                        .foregroundColor(.black)
                                    }
                                    .frame(width: 250)
                                }
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 250, height: 150)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            viewModel.getMovieList(id: movie.id)
        }
        
    }
}

struct MovieRecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRecommendationView(viewModel: MovieRecommendationViewModel(), movie: ExampleData.movie)
    }
}
