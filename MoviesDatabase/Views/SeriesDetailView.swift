//
//  SeriesDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct SeriesDetailView: View {
    var series: Series = Series()
    
    var body: some View {
        ScrollView {
            VStack {
                let url = URL(string: series.primaryImage.url)
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                } placeholder: {
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                }

            }
        }
        .navigationTitle("\(series.titleText.text)")
    }
}

struct SeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesDetailView()
    }
}
