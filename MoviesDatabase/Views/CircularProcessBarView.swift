//
//  CircularProcessBarView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/29/24.
//

import SwiftUI

struct CircularProcessBarView: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            ZStack {
                Color.black
                    .cornerRadius(90)
                
                Circle()
                    .stroke(
                        Color.green.opacity(0.5),
                        lineWidth: 3
                    )
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: 3,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress)
            }
            .frame(width: 30, height: 30)
            
            VStack(alignment: .leading) {
                Text("\(progress * 100, specifier: "%.0f")%")
                    .font(.system(size: 10))
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .frame(width: 30, height: 30)
    }
}

struct CircularProcessBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProcessBarView(progress: CGFloat(60 / 100))
            .colorScheme(.dark)
    }
}
