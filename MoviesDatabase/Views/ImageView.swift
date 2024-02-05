//
//  ImageView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/5/24.
//

import SwiftUI

struct ImageView: View {
    var url: String

    var body: some View {
        let url = URL(string: self.url)
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 150)
            
        } placeholder: {
             ProgressView()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://image.tmdb.org/t/p/w500/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg")
            
    }
}
