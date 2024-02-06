//
//  KeywordSeriesListView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/6/24.
//

import SwiftUI

struct KeywordSeriesListView: View {
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
                            SeriesKeywordListView(viewModel: KeywordSeriesListViewModel(), keyword: keyword)
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

struct KeywordSeriesListView_Previews: PreviewProvider {
    static var previews: some View {
        KeywordSeriesListView(viewModel: KeywordViewModel(), id: 572802)
    }
}
