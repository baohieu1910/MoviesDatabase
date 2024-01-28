//
//  SeriesRowView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/28/24.
//

import SwiftUI

struct SeriesRowView: View {
    var series: Series = Series()
    
    var body: some View {
        HStack {
            let url = URL(string: series.primaryImage.url)
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: UIScreen.screenWidth / 10, height: UIScreen.screenHeight / 10)
                
                    .padding()
            } placeholder: {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: UIScreen.screenWidth / 10, height: UIScreen.screenHeight / 10)
                    .padding()
            }
            
            VStack {
                Text("\(series.titleText.text)")
                    .font(.title)
                Text("\(series.releaseDate.year)")
            }
        }
    }
}

struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView()
    }
}
