//
//  SeriesRowView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct MovieRowView: View {
    var movie: Movie = Movie()
    
    let width = UIScreen.screenWidth / 4
    let height = UIScreen.screenHeight / 6
    
    var body: some View {
        HStack {
            let url = URL(string: movie.getMoviePoster())
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: width, height: height)
                    .padding()
            } placeholder: {
                Image("tmdb.jpg")
                    .resizable()
                    .frame(width: min(width, height), height: min(width, height))
                    .padding()
            }
            VStack {
                Text("\(movie.title)")
                    .font(.title2)
                Text("\(movie.voteAverage)")
                    .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView()
    }
}
