//
//  CastCardView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct CastCardView: View {
    var cast: Cast
    
    let width = UIScreen.screenWidth / 4
    let height = UIScreen.screenHeight / 5
    
    var body: some View {
        let url = URL(string: Utils.getCastImage(profilePath: cast.profilePath))
        AsyncImage(url: url) { image in
            VStack(spacing: 0) {
                image
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width: 160, height: 160, alignment: .center)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text("\(cast.name ?? "N/A")")
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .padding(.horizontal)
                    
                    Text("\(cast.character ?? "N/A")")
                        .font(.footnote)
                        .lineLimit(1)
                        .padding(.horizontal)
                }
                .foregroundColor(.white)
                .frame(width: 160, height: 50)
            }
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white)
            }
            
        } placeholder: {
            ProgressView()
                .frame(width: 160, height: 210)
        }
            
    }
}

struct CastCardView_Previews: PreviewProvider {
    static var previews: some View {
        CastCardView(cast: ExampleData.cast)
    }
}
