//
//  CastCardView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct CastCardView: View {
    var cast: Cast = Cast()
    
    let width = UIScreen.screenWidth / 4
    let height = UIScreen.screenHeight / 5
    
    var body: some View {
        VStack {
            let url = URL(string: cast.getCastImage())
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: 180, height: 200)
                
            } placeholder: {
                Image("noImage")
                    .resizable()
                    .frame(width: 180, height: 200)
            }
            
            VStack(alignment: .leading) {
                Text("\(cast.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding(.horizontal)
                            
                Text("\(cast.character)")
                    .font(.footnote)
                    .lineLimit(1)
                    .padding(.horizontal)
            }
            .frame(width: 180, height: 60)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 2)
        .padding()
    }
}

struct CastCardView_Previews: PreviewProvider {
    static var previews: some View {
        CastCardView()
            .environmentObject(CastListViewModel())
    }
}
