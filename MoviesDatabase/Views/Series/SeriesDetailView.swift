//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct SeriesDetailView: View {
    @ObservedObject var viewModel: SeriesDetailViewModel
    @ObservedObject var castVM = CastSeriesListViewModel()
    @ObservedObject var imagesVM = ImagesViewModel()
    @ObservedObject var keywordsVM = KeywordViewModel()
    @ObservedObject var recommendVM = SeriesRecommendationViewModel()
    
    @State var averageColor: Color = .black
    var series: Series
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack {
                    // MARK: Movie Poster
                    ZStack(alignment: .leading) {
                        let backgroundUrl = URL(string: Utils.getMovieBackground(backdropPath: viewModel.series?.backdropPath))
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
                                
                                LinearGradient(gradient: Gradient(colors: [.clear, averageColor]), startPoint: .top, endPoint: .bottom)
                                    .opacity(1)
                                
//                                let posterUrl = URL(string: Utils.getMoviePoster(posterPath: viewModel.series?.posterPath))
//                                AsyncImage(url: posterUrl) { image in
//                                    ZStack {
//                                        image
//                                            .resizable()
//                                            .frame(width: 100, height: 150)
//                                            .cornerRadius(10)
//                                            .padding(.horizontal)
//                                    }
//
//                                } placeholder: {
//                                    ProgressView()
//                                        .frame(height: 150)
//                                }
                            }
                        } placeholder: {
                            ProgressView()
                                .frame(height: 150)
                        }
                    }
                    
                    // MARK: Movie title
                    VStack {
                        VStack {
                            Text("\(viewModel.series?.name ?? "N/A")")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        HStack {
                            Spacer()
                            HStack {
                                CircularProcessBarView(progress: (series.voteAverage ?? 0) / 10)
                                
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
                                Text("\(Utils.getReleaseDate(releaseDate: viewModel.series?.releaseDate))")
                            }
                            .frame(width: UIScreen.screenWidth)
                            
                            HStack {
                                ForEach(viewModel.series?.genres ?? []) { genres in
                                    NavigationLink {
                                        SeriesGenresView(viewModel: SeriesGenresViewModel(), genres: genres)
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
                        }
                        .padding(.vertical, 10)
                        .background(averageColor.speechAdjustedPitch(30))
                        .font(.subheadline)
                        
                        VStack(alignment: .leading) {
                            Text("\(viewModel.series?.tagline ?? "")")
                                .italic()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Overview")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("\(viewModel.series?.overview ?? "-")")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                    }
                }
                .padding([.bottom, .horizontal])
                .background(averageColor)
                .foregroundColor(.white)
                
                
                // MARK: Cast
                SeriesCastListView(viewModel: castVM, id: series.id)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                
                // MARK: Recommendations
                VStack(alignment: .leading) {
                    Text("Recommendations")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    SeriesRecommendationView(viewModel: recommendVM, series: series)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // MARK: Images
                SeriesImagesView(viewModel: imagesVM, id: series.id)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                // MARK: Other Information
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Original Title")
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.series?.originalName ?? "N/A")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Status")
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.series?.status ?? "-")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Type")
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.series?.type ?? "-")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    // MARK: Keywords
                    KeywordSeriesListView(viewModel: keywordsVM, id: series.id)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.bottom, .horizontal])
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .onAppear {
                viewModel.getSeriesDetail(id: series.id)
                castVM.getCastList(id: series.id)
                imagesVM.getSeriesImages(id: series.id)
                keywordsVM.getSeriesKeyword(id: series.id)
                recommendVM.getSeriesList(id: series.id)
            }
            .foregroundColor(.black)
        }
        .edgesIgnoringSafeArea(.top)
    }

}

struct SeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesDetailView(viewModel: SeriesDetailViewModel(), series: ExampleData.series)
    }
}
