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
        VStack {
            let url = URL(string: cast.getCastImage())
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: 135, height: 160)
                
            } placeholder: {
                Image("noImage")
                    .resizable()
                    .frame(width: 135, height: 160)
            }
            
            VStack(alignment: .leading) {
                Text("\(cast.name)")
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.horizontal)
                            
                Text("\(cast.character)")
                    .font(.footnote)
                    .lineLimit(1)
                    .padding(.horizontal)
            }
            .foregroundColor(.black)
            .frame(width: 135, height: 60)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 2)
        .padding(.vertical)
    }
}

struct CastCardView_Previews: PreviewProvider {
    static var previews: some View {
        CastCardView(cast: Cast())
            .environmentObject(CastListViewModel())
    }
}
