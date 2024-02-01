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
        ScrollView {
            // MARK: Image and name
            VStack {
                let url = URL(string: viewModel.people?.getPeopleImage() ?? "")
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .center)
                        .clipped()
                        .cornerRadius(10)
                    
                } placeholder: {
                    ProgressView()
                }
                
                Text("\(viewModel.people?.name ?? "N/A")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding()
            
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
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.white)
        .foregroundColor(.black)
        .onAppear {
            viewModel.getPeopleDetail(id: cast.id)
        }
        
    }
    
    
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView(viewModel: PeopleViewModel(), cast: ExampleData.cast)
    }
}
