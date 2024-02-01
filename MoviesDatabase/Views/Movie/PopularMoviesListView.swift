//
//  PopularMoviesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI


struct PopularMoviesListView: View {
    @Binding var presentSideMenu: Bool
    @ObservedObject var viewModel: PopularMoviesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.movies) { movie in
                    NavigationLink {
                        MovieDetailView(castVM: CastListViewModel(), movieVM: MovieDetailViewModel(), movie: movie)
                    } label: {
                        MovieRowView(movie: movie)
                            .foregroundColor(.black)
                            .padding([.bottom, .horizontal])
                    }
                }
//                VStack {
//                    Button {
//                        viewModel.getPopularMovie()
//                    } label: {
//                        Text("Load More")
//                    }
//                }
                
            }
            .navigationTitle("Popular Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image("menu")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear {
//            UINavigationBar.appearance().scrollEdgeAppearance = .white
            viewModel.getPopularMovie()
        }
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesListView(presentSideMenu: Binding.constant(false), viewModel: PopularMoviesViewModel())
    }
}
