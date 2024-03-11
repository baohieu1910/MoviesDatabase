//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI
import UIKit

struct MovieDetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: MovieDetailViewModel
    @ObservedObject var castVM = CastMovieListViewModel()
    @ObservedObject var imagesVM = ImagesViewModel()
    @ObservedObject var keywordsVM = KeywordViewModel()
    @ObservedObject var recommendVM = MovieRecommendationViewModel()
    @State var averageColor: Color = .black
    var movie: Movie
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack {
                        // MARK: Movie Poster
                        ZStack {
                            let backgroundUrl = URL(string: Utils.getMovieBackground(backdropPath: viewModel.movie?.backdropPath))
                            AsyncImage(url: backgroundUrl) { image in
                                ZStack(alignment: .leading) {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .scaledToFill()
                                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                                        .clipped()
                                        .cornerRadius(5)
                                        .onAppear {
                                            averageColor = Color(image.averageColor ?? UIColor.black)
                                        }
                                    
                                    LinearGradient(colors: [.clear, averageColor], startPoint: .top, endPoint: .bottom)
                                }
                            } placeholder: {
                                ProgressView()
                                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                            }
                        }
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                        
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
                            }
                            .padding(.vertical, 10)
                            .font(.subheadline)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(viewModel.movie?.genres ?? []) { genres in
                                        NavigationLink {
                                            MoviesGenresView(viewModel: MovieGenresViewModel(), genres: genres)
                                        } label: {
                                            Text("\(genres.name)")
                                                .padding(10)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 90)
                                                        .stroke(.white)
                                                }
                                        }
                                    }
                                }
                                .padding(.vertical)
                            }
                            .padding(.horizontal)
                            
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
                        
                        // MARK: Cast
                        MovieCastListView(viewModel: castVM, id: movie.id)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
                        // MARK: Recommendations
                        MovieRecommendationView(viewModel: recommendVM, movie: movie)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
                        
                        // MARK: Images
                        MovieImagesView(viewModel: imagesVM, id: movie.id)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
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
                        
                        VStack {
                            Text("")
                                .padding(.vertical, 30)
                        }
                    }
                    .background(averageColor.speechAdjustedPitch(1))
                    .foregroundColor(.white)
                }
                .onAppear {
                    viewModel.getMovieDetail(id: movie.id)
                    castVM.getCastList(id: movie.id)
                    imagesVM.getMovieImages(id: movie.id)
                    keywordsVM.getMovieKeyword(id: movie.id)
                    recommendVM.getMovieList(id: movie.id)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .frame(width: UIScreen.screenWidth / 10, height: UIScreen.screenWidth / 10)
                            .background(.white)
                            .foregroundColor(.black)
                            .cornerRadius(90)
                            .padding(.horizontal, UIScreen.screenWidth / 10)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
    
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(), movie: ExampleData.movie)
    }
}
