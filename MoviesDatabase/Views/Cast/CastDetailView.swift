//
//  CastDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import SwiftUI

struct CastDetailView: View {
    @ObservedObject var viewModel: PeopleViewModel
    var cast: Cast
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // MARK: Image and name
            VStack {
                let url = URL(string: Utils.getCastImage(profilePath: viewModel.people?.profilePath))
                AsyncImage(url: url) { image in
                    ZStack {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth, alignment: .center)
                            .clipped()
                            .cornerRadius(10)
                        
                        LinearGradient(colors: [.clear, .clear, .black], startPoint: .top, endPoint: .bottom)
                    }
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth, alignment: .center)
                }
                
                Text("\(viewModel.people?.name ?? "N/A")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Divider()
                .frame(height: 3)
            
            // MARK: Personal Info
            VStack(alignment: .leading) {
                Text("Personal Info")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Known For")
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.people?.knownFor ?? "-")")
                    }.padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Birthday")
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.people?.birthday ?? "-")")
                    }.padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Place of birth")
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.people?.placeOfBirth ?? "-")")
                    }.padding(.bottom)
                }
                .padding(.bottom)
                
                // MARK: Biography
                VStack(alignment: .leading) {
                    Text("Biography")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("\((viewModel.people?.biography ?? "" == "" ? ("We dont't have a biography for \(viewModel.people?.name ?? "N/A")") : viewModel.people?.biography ?? "-"))")
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .navigationTitle("Actor")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getPeopleDetail(id: cast.id)
        }
        
    }
    
    
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView(viewModel: PeopleViewModel(), cast: ExampleData.cast)
            .environment(\.colorScheme, .dark)
    }
}
