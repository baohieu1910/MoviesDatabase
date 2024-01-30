//
//  CastDetailView.swift
//  MoviesDatabase
//
//  Created by Hieu Le on 1/30/24.
//

import SwiftUI

struct CastDetailView: View {
    @EnvironmentObject var viewModel: PeopleViewModel
    var cast: Cast
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    let url = URL(string: viewModel.people.getPeopleImage())
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(width: 200, height: 240)
                            .cornerRadius(10)
                        
                    } placeholder: {
                        Image("noImage")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    
                    Text("\(viewModel.people.name)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding()
                
                Divider()
                    .frame(height: 3)
                
                VStack(alignment: .leading) {
                    Text("Personal Info")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Known For")
                                .fontWeight(.bold)
                            
                            Text("\(viewModel.people.knownFor ?? "N/A")")
                        }.padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("Birthday")
                                .fontWeight(.bold)
                            
                            Text("\(viewModel.people.birthday ?? "N/A")")
                        }.padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("Place of birth")
                                .fontWeight(.bold)
                            
                            Text("\(viewModel.people.placeOfBirth ?? "N/A")")
                        }.padding(.bottom)
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Biography")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("\(viewModel.people.biography ?? "N/A")")
                        
                    }
                }
                .padding()
            }
            .background(.white)
            .foregroundColor(.black)
        }
        .onAppear {
            viewModel.getPeopleDetail(id: cast.id)
        }
    }
    
    
}

struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView(cast: Cast())
            .environmentObject(PeopleViewModel())
    }
}
