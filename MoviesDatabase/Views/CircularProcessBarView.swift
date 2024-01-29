//
//  CircularProcessBarView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct CircularProcessBarView: View {
    var progress: CGFloat = 60 / 100
    
    private let width = UIScreen.screenWidth / 30
    
    var body: some View {
        ZStack {
            ZStack {
                Color.black
                    .cornerRadius(90)
                
                Circle()
                    .stroke(
                        Color.green.opacity(0.5),
                        lineWidth: width
                    )
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: width,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress)
            }
            .frame(width: width * 10, height: width * 10)
            
            VStack(alignment: .leading) {
                Text("\(progress * 100, specifier: "%.0f")%")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .scaleEffect(0.3)
        .frame(width: width * 3, height: width * 3)
    }
}

struct CircularProcessBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProcessBarView()
            .colorScheme(.dark)
    }
}
