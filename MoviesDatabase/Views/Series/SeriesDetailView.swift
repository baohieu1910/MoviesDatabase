//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct SeriesDetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: SeriesDetailViewModel
    @ObservedObject var castVM = CastSeriesListViewModel()
    @ObservedObject var imagesVM = ImagesViewModel()
    @ObservedObject var keywordsVM = KeywordViewModel()
    @ObservedObject var recommendVM = SeriesRecommendationViewModel()
    
    @State var averageColor: Color = .black
    var series: Series
    
    var body: some View {
        ZStack {
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
                                }
                            } placeholder: {
                                ProgressView()
                                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 3)
                            }
                        }
                        
                        // MARK: Series title
                        VStack {
                            VStack {
                                Text("\(series.name ?? "N/A")")
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
                                    Text("\(Utils.getReleaseDate(releaseDate: series.releaseDate))")
                                }
                                .frame(width: UIScreen.screenWidth)
                            }
                            .padding(.vertical, 10)
                            .background(averageColor.speechAdjustedPitch(30))
                            .font(.subheadline)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
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
                                .padding(.vertical)
                            }
                            .padding(.horizontal)
                            
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
                                
                                Text("\(series.overview ?? "-")")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            
                        }
                        // MARK: Cast
                        SeriesCastListView(viewModel: castVM, id: series.id)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)

                        // MARK: Recommendations
                        SeriesRecommendationView(viewModel: recommendVM, series: series)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
                        // MARK: Images
                        SeriesImagesView(viewModel: imagesVM, id: series.id)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
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
                        
                        VStack {
                            Text("")
                                .padding(.vertical, 30)
                        }
                    }
                    .background(averageColor)
                    .foregroundColor(.white)
                }
                .onAppear {
                    viewModel.getSeriesDetail(id: series.id)
                    castVM.getCastList(id: series.id)
                    imagesVM.getSeriesImages(id: series.id)
                    keywordsVM.getSeriesKeyword(id: series.id)
                    recommendVM.getSeriesList(id: series.id)
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

struct SeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesDetailView(viewModel: SeriesDetailViewModel(), series: ExampleData.series)
    }
}
