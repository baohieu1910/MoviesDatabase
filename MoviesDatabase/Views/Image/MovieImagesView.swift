//
//  MovieImagesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/5/24.
//

import SwiftUI

struct MovieImagesView: View {
    @ObservedObject var viewModel: ImagesViewModel
    var id: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Media")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.images) { image in
                        ImageView(url: Utils.getImage(filePath: image.filePath))
                    }
                }
            }
            .frame(height: 150)
            .padding(.bottom, 10)
            
        }
        .padding(.horizontal)
    }
}

struct MovieImagesView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImagesView(viewModel: ImagesViewModel(), id: 117642)
    }
}
