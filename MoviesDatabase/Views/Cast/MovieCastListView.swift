//
//  MovieCastListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/5/24.
//

import SwiftUI

struct MovieCastListView: View {
    @ObservedObject var viewModel: CastMovieListViewModel
    var id: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Billed Cast")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.casts) { cast in
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
        .onAppear {
            viewModel.getCastList(id: id)
        }
        
    }
}

struct MovieCastListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCastListView(viewModel: CastMovieListViewModel(), id: 572802)
    }
}
