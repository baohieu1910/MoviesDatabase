//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI
import UIKit

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

struct MovieDetailView: View {
    @EnvironmentObject var viewModel: CastListViewModel
    
    var movie: Movie = Movie()
    
    var body: some View {
        ScrollView {
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
                            
                            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .trailing, endPoint: .leading)
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
                        image
                            .resizable()
                            .frame(width: 100, height: 150)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        
                        
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
            
            // MARK: Cast
            VStack(alignment: .leading) {
                Text("Top Billed Cast")
                    .font(.title)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.casts) { cast in
                            CastCardView(cast: cast)
                                
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            
            VStack(alignment: .leading) {
                Text("Original Title")
                
                Text("Status")
                
                Text("Original Language")
                
                Text("Budget")
                
                Text("Revenue")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }
        .onAppear {
            viewModel.getCastList(id: movie.id)
        }
        
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
            .environmentObject(CastListViewModel())
    }
}
