//
//  MovieKeywordsList.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import SwiftUI

struct MovieKeywordsList: View {
    @ObservedObject var viewModel: KeywordViewModel
    var id: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Keywords")
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.keywords) { keyword in
                        NavigationLink {
                            MovieKeywordListView(viewModel: KeywordMovieListViewModel(), keyword: keyword)
                        } label: {
                            Text("\(keyword.name)")
                                .padding(10)
                                .background(Color("LightGray"))
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct MovieKeywordsList_Previews: PreviewProvider {
    static var previews: some View {
        MovieKeywordsList(viewModel: KeywordViewModel(), id: 572802)
    }
}
