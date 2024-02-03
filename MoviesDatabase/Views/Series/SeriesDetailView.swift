//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/3/24.
//

import SwiftUI

struct SeriesDetailView: View {
    //        @ObservedObject var castVM: CastListViewModel
    @ObservedObject var seriesVM: SeriesDetailViewModel
    @ObservedObject var castVM: CastSeriesListViewModel
    
    @State var averageColor: Color = .black
    var series: Series
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    VStack {
                        // MARK: Movie Poster
                        ZStack(alignment: .leading) {
                            let backgroundUrl = URL(string: seriesVM.series?.getMovieBackground() ?? "")
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
                                    
                                    let posterUrl = URL(string: seriesVM.series?.getMoviePoster() ?? "")
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
                                Text("\(seriesVM.series?.name ?? "N/A")")
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
                                    Text("\(seriesVM.series?.getReleaseDate() ?? "N/A")")
                                }
                                .frame(width: UIScreen.screenWidth)
                                .padding(.vertical, 10)
                                .background(averageColor.speechAdjustedPitch(30))
                                
                            }
                            .font(.subheadline)
                            
                            VStack(alignment: .leading) {
                                Text("\(seriesVM.series?.tagline ?? "")")
                                    .italic()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Overview")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                Text("\(seriesVM.series?.overview ?? "-")")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                            
                        }
                    }
                    .padding([.bottom, .horizontal])
                    .background(averageColor)
                    .foregroundColor(.white)
                }
                
                // MARK: Cast
                VStack(alignment: .leading) {
                    Text("Series Cast")
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
                    
                    Text("We don't have enough data to suggest any movies based on \(seriesVM.series?.name  ?? "N/A"). You can help by rating movies you've seen.")
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // MARK: Other Infomation
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Original Title")
                            .fontWeight(.bold)
                        
                        Text("\(seriesVM.series?.originalName ?? "N/A")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    VStack(alignment: .leading) {
                        Text("Status")
                            .fontWeight(.bold)
                        
                        Text("\(seriesVM.series?.status ?? "-")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                    //                VStack {
                    //                    Text("Original Language")
                    //                }
                    
                    VStack(alignment: .leading) {
                        Text("Type")
                            .fontWeight(.bold)
                        
                        Text("\(seriesVM.series?.type ?? "-")")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom, .horizontal])
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .onAppear {
                seriesVM.getSeriesDetail(id: series.id)
                castVM.getCastList(id: series.id)
            }
            .foregroundColor(.black)
        }
    }

}

struct SeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesDetailView(seriesVM: SeriesDetailViewModel(), castVM: CastSeriesListViewModel(), series: ExampleData.series)
    }
}
