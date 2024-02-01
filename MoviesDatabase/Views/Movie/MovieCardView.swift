//
//  MovieCardView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct MovieCardView: View {
    var movie: Movie
    
    var body: some View {
        
        let url = URL(string: movie.getMoviePoster())
        AsyncImage(url: url) { image in
            VStack {
                ZStack {
                    image
                        .resizable()
                        .frame(width: 140, height: 200)
                        .cornerRadius(5)
                    
                    CircularProcessBarView(progress: movie.voteAverage / 10)
                        .offset(x: -50, y: 100)
                }
                
                Spacer()
                
                VStack {
                    Text("\(movie.title)")
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .foregroundColor(.black)
                    
                    
                    Text("\(movie.getReleaseDate())")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                }
            }
            .frame(width: 140, height: 260)
            .padding([.vertical, .trailing])
        } placeholder: {
            ProgressView()
        }
            
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: ExampleData.movie)
    }
}
