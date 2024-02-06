//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI
import UIKit

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    @ObservedObject var castVM = CastMovieListViewModel()
    @ObservedObject var imagesVM = ImagesViewModel()
    @ObservedObject var keywordsVM = KeywordViewModel()
    
    @State var averageColor: Color = .black
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    // MARK: Movie Poster
                    ZStack(alignment: .leading) {
                        let backgroundUrl = URL(string: Utils.getMovieBackground(backdropPath: viewModel.movie?.backdropPath))
                        AsyncImage(url: backgroundUrl) { image in
                            ZStack(alignment: .leading) {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                    .onAppear {
                                        averageColor = Color(image.averageColor ?? UIColor.black)
                                    }
                                
                                LinearGradient(gradient: Gradient(colors: [.clear, averageColor]), startPoint: .trailing, endPoint: .leading)
                                    .opacity(1)
                                
                                let posterUrl = URL(string: Utils.getMoviePoster(posterPath: viewModel.movie?.posterPath))
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
                                        .frame(height: 150)
                                }
                            }
                        } placeholder: {
                            ProgressView()
                                .frame(height: 150)
                        }
                    }
                    
                    // MARK: Movie title
                    VStack {
                        VStack {
                            Text("\(viewModel.movie?.title ?? "N/A")")
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
                                Text("\(Utils.getReleaseDate(releaseDate: viewModel.movie?.releaseDate))")
                                
                                Text(" - ")
                                
                                Text("\(viewModel.movie?.runtime ?? 0)m")
                            }
                            .frame(width: UIScreen.screenWidth)
                            
                            HStack {
                                ForEach(viewModel.movie?.genres ?? []) { genres in
                                    NavigationLink {
                                        MoviesGenresView(viewModel: MovieGenresViewModel(), genres: genres)
                                    } label: {
                                        Text("\(genres.name)")
                                    }
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        .background(averageColor.speechAdjustedPitch(30))
                        .font(.subheadline)
                        
                        VStack(alignment: .leading) {
                            Text("\(viewModel.movie?.tagline ?? "")")
                                .italic()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Overview")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("\(viewModel.movie?.overview ?? "-")")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                    }
                }
                .padding([.bottom, .horizontal])
                .background(averageColor)
                .foregroundColor(.white)
                
                
                // MARK: Cast
                MovieCastListView(viewModel: castVM, id: movie.id)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: Recommendations
                VStack(alignment: .leading) {
                    Text("Recommendations")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Text("We don't have enough data to suggest any movies based on \(viewModel.movie?.title  ?? "N/A"). You can help by rating movies you've seen.")
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // MARK: Images
                MovieImagesView(viewModel: imagesVM, id: movie.id)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                // MARK: Other Information
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Original Title")
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.movie?.originalTitle ?? "N/A")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Status")
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.movie?.status ?? "-")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Budget")
                            .fontWeight(.bold)
                        
                        Utils.getBudget(budget: viewModel.movie?.budget)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Revenue")
                            .fontWeight(.bold)
                        
                        Utils.getRevenue(revenue: viewModel.movie?.revenue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    // MARK: Keywords
                    KeywordMovieListView(viewModel: keywordsVM, id: movie.id)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.bottom, .horizontal])
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                
            }
            .onAppear {
                viewModel.getMovieDetail(id: movie.id)
                castVM.getCastList(id: movie.id)
                imagesVM.getMovieImages(id: movie.id)
                keywordsVM.getMovieKeyword(id: movie.id)
            }
            .foregroundColor(.black)
        }
    }
    
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(), movie: ExampleData.movie)
    }
}
