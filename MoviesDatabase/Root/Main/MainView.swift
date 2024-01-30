//  MainView
//  MoviesDatabase
//
//  Created by Hung Le on 1/30/24.
//

import SwiftUI

struct MainView: View {
    @Environment(\.presentationMode) private var presentationMode

    // Private variable
    @StateObject private var vm: MainVM = MainVM()
    @State private var fullScreen: MainVM.Fullscreen?
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        contentView
            .onReceive(vm.$fullScreen) { identifier in
                self.fullScreen = identifier
            }
            .fullScreenCover(item: $fullScreen) { identifier in
                // Add your full-screen cover view here if needed
            }
    }
}

// MARK: - Private functions
private extension MainView {
    @ViewBuilder var contentView: some View {
        NavigationStack {
            ScrollView {
//                VStack(alignment: .leading) {
//                    Text("Welcome.")
//                        .font(.title)
//                        .fontWeight(.bold)
//
//                    Text("Millions of movies, TV shows and people to discover. Explore now.")
//                        .font(.title2)
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
                
                VStack(alignment: .leading) {
                    Text("Trending")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(vm.moviesToday) { movie in
                                NavigationLink(value: movie) {
                                    MovieCardView(movie: movie)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .foregroundColor(.black)
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
                    .environmentObject(CastListViewModel())
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image("menu")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear {
            vm.getMoviesToday()
        }
    }
}

// MARK: - MainView's Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(presentSideMenu: Binding.constant(false))
            .environmentObject(TrendingMovieViewModel())
    }
}
