//
//  SearchView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/4/24.
//

import SwiftUI

//struct SearchView: View {
//    @ObservedObject var viewModel: SearchMovieViewModel
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                ForEach(viewModel.movies) { movie in
//                    NavigationLink {
//                        MovieDetailView(viewModel: MovieDetailViewModel(), movie: movie)
//                    } label: {
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text("\(movie.title ?? "N/A")")
//                                    .lineLimit(1)
//                                Divider()
//                            }
//                            .frame(maxWidth: .infinity, alignment: .leading)
//
//                            Spacer()
//
//                            Image(systemName: "chevron.right")
//
//                        }
//                        .foregroundColor(.black)
//                        .padding(.horizontal)
//                    }
//
//
//                }
//            }
//            .navigationTitle("Search")
//        }
//        .searchable(text: $viewModel.searchText)
//        .onChange(of: viewModel.searchText, perform: { newValue in
//            viewModel.getSearchMovies(name: viewModel.searchText)
//        })
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(viewModel: SearchMovieViewModel())
//    }
//}
