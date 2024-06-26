//
//  MoviesView.swift
//  MoviesApp
//
//  Created by Lean on 18/06/2024.
//

import SwiftUI
import Kingfisher

struct MoviesView: View {
    @StateObject private var viewModel = MoviesViewModel()
    
    var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                
                VStack {
                    Text("Upcoming Movies")
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal){
                        LazyHGrid(rows: gridItemLayout, spacing: 20){
                            ForEach(viewModel.upcomingMovies, id: \.id){movie in
                                NavigationLink{
                                    MovieDetailView(movie: movie)
                                }label: {
                                    KFImage(URL(string: "\(Constants.ulrImages)\(movie.poster_path ?? Constants.placeholder)"))
                                        .resizable()
                                        .placeholder { progress in
                                            ProgressView()
                                        }
                                        .cornerRadius(12)
                                        .frame(width: 150, height: 210)
                                }
                                
                            }
                            
                        }
                    }
                    
                    Text("Now Playing")
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal){
                        LazyHGrid(rows: gridItemLayout, spacing: 20){
                            ForEach(viewModel.nowPlayingMovies, id: \.id){movie in
                                NavigationLink{
                                    MovieDetailView(movie: movie)
                                }label: {
                                    KFImage(URL(string: "\(Constants.ulrImages)\(movie.poster_path ?? Constants.placeholder)"))
                                        .resizable()
                                        .placeholder { progress in
                                            ProgressView()
                                        }
                                        .cornerRadius(12)
                                        .frame(width: 150, height: 210)
                                }
                                
                            }
                            
                        }
                    }
                    
                    Text("Trending")
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal){
                        LazyHGrid(rows: gridItemLayout, spacing: 20){
                            ForEach(viewModel.trendingMovies, id: \.id){movie in
                                NavigationLink{
                                    MovieDetailView(movie: movie)
                                }label: {
                                    KFImage(URL(string: "\(Constants.ulrImages)\(movie.poster_path ?? Constants.placeholder)"))
                                        .resizable()
                                        .placeholder { progress in
                                            ProgressView()
                                        }
                                        .cornerRadius(12)
                                        .frame(width: 150, height: 210)
                                }
                                
                            }
                            
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    MoviesView()
}
