//
//  SeriesCastListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/5/24.
//

import SwiftUI

struct SeriesCastListView: View {
    @ObservedObject var viewModel: CastSeriesListViewModel
    var id: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Series Cast")
                .font(.title)
                .fontWeight(.bold)
            
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
                .frame(height: 220)
                .padding(.bottom, 10)
            }
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.getCastList(id: id)
        }
    }
}

struct SeriesCastListView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesCastListView(viewModel: CastSeriesListViewModel(), id: 1396)
    }
}
