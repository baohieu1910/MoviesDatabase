//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI
import UIKit

struct MovieDetailView: View {
    @ObservedObject var castVM: CastMovieListViewModel
    @ObservedObject var movieVM: MovieDetailViewModel
    @ObservedObject var imageVM: ImagesViewModel
    
    @State var averageColor: Color = .black
    var movie: Movie
    
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    // MARK: Movie Poster
                    ZStack(alignment: .leading) {
                        let backgroundUrl = URL(string: movieVM.movie?.getMovieBackground() ?? "")
                        AsyncImage(url: backgroundUrl) { image in
                            ZStack(alignment: .leading) {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .onAppear {
                                        averageColor = Color( image.averageColor ?? UIColor.black)
                                    }
                                
                                LinearGradient(gradient: Gradient(colors: [.clear, averageColor]), startPoint: .trailing, endPoint: .leading)
                                    .opacity(1)
                                
                                let posterUrl = URL(string: movieVM.movie?.getMoviePoster() ?? "")
                                AsyncImage(url: posterUrl) { image in
                                    ZStack {
                                        image
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(10)
                                            .padding(.horizontal)
                                    }
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        } placeholder: {
                            ProgressView()
                        }
                    }
//                        .padding(.horizontal)
                    
                    // MARK: Movie title
                    VStack {
                        VStack {
                            Text("\(movieVM.movie?.title ?? "N/A")")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                        }
                        
                        HStack {
                            Spacer()
                            HStack {
                                CircularProcessBarView(progress: (movie.voteAverage ?? 0) / 10)
                                
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
                        
                        VStack {
                            HStack {
                                Text("\(movieVM.movie?.getReleaseDate() ?? "N/A")")
                                
                                Text(" - ")
                                
                                Text("\(movieVM.movie?.runtime ?? 0)m")
                            }
                            .frame(width: UIScreen.screenWidth)
                            .padding(.vertical, 10)
                            .background(averageColor.speechAdjustedPitch(30))
                            
                            
                        }
                        .font(.subheadline)
                        
                        VStack(alignment: .leading) {
                            Text("\(movieVM.movie?.tagline ?? "")")
                                .italic()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Overview")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("\(movieVM.movie?.overview ?? "-")")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                    }
                }
                .padding([.bottom, .horizontal])
                .background(averageColor)
                .foregroundColor(.white)
                
                
                // MARK: Cast
                VStack(alignment: .leading) {
                    Text("Top Billed Cast")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(castVM.casts) { cast in
                                NavigationLink {
                                    CastDetailView(viewModel: PeopleViewModel(), cast: cast)
                                } label: {
                                    CastCardView(cast: cast)
                                }
                                
                            }
                        }
                    }
                    .padding()
                }
                .padding()
                //            .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: Recommendations
                VStack(alignment: .leading) {
                    Text("Recommendations")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Text("We don't have enough data to suggest any movies based on \(movieVM.movie?.title  ?? "N/A"). You can help by rating movies you've seen.")
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // MARK: Images
                VStack(alignment: .leading) {
                    VStack {
                        Text("Media")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(imageVM.images) { image in
                                ImageView(url: image.getImage())
                                
                            }
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // MARK: Other Infomation
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Original Title")
                            .fontWeight(.bold)
                        
                        Text("\(movieVM.movie?.originalTitle ?? "N/A")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Status")
                            .fontWeight(.bold)
                        
                        Text("\(movieVM.movie?.status ?? "-")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Budget")
                            .fontWeight(.bold)
                        
                        movieVM.movie?.getBudget()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Revenue")
                            .fontWeight(.bold)
                        
                        movieVM.movie?.getRevenue()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .onAppear {
                castVM.getCastList(id: movie.id)
                movieVM.getMovieDetail(id: movie.id)
                imageVM.getMovieImages(id: movie.id)
            }
            .foregroundColor(.black)
        }
    }
    
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(castVM: CastMovieListViewModel(), movieVM: MovieDetailViewModel(), imageVM: ImagesViewModel(), movie: ExampleData.movie)
    }
}
