//
//  SeriesImagesView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 2/5/24.
//

import SwiftUI

struct SeriesImagesView: View {
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
            .padding(.bottom, 10)
        }
        .padding(.horizontal)
    }
}

struct SeriesImagesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesImagesView(viewModel: ImagesViewModel(), id: 1396)
    }
}
