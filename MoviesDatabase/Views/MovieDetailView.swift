//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie = Movie()
    
    let width = UIScreen.screenWidth / 4
    let height = UIScreen.screenHeight / 5
    
    var body: some View {
        ScrollView {
            VStack {
                let url = URL(string: movie.getMoviePoster())
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                } placeholder: {
                    Image("tmdb.jpg")
                        .resizable()
                        .frame(width: min(width, height), height: min(width, height))
                        .padding()
                }

            }
        }
        .navigationTitle("\(movie.title)")
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
