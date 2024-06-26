//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Lean on 21/06/2024.
//

import SwiftUI
import Kingfisher
import YouTubeiOSPlayerHelper

struct MovieDetailView: View {
    @StateObject var viewModel = TrailerViewModel()
    
    let movie: DataMovie
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                
                //trailerView
                if !viewModel.listOfTrailers.isEmpty{
                    YTWrapper(videoId: "\(viewModel.listOfTrailers[0].key)")
                        .frame(height: 200)
                        .cornerRadius(12)
                        .padding(.horizontal,15)
                }
                
                
                //title
                
                Text(movie.title ?? movie.original_title ?? "")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.red)
                    .padding(.horizontal, 15)
                
                //Description
                Text(movie.overview ?? "")
                    .font(.body)
                    .padding(.horizontal, 15)
                
                HStack{
                    Text("Realease \(movie.release_date ?? "")")
                        .font(.title3)
                    
                    Button {
                        //agrego a fav
                    } label: {
                        Image(systemName: "heart")
                    }

                    
                }
                
                //Trailers
                ScrollView{
                    ForEach(viewModel.listOfTrailers, id: \.key){ trailer in
                        HStack{
                            AsyncImage(url: URL(string: "\(Constants.ulrImages)\(movie.backdrop_path ?? "")")){ image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .shadow(radius: 12)
                            
                            Spacer()
                            
                            VStack{
                                Text(trailer.name)
                                    .lineLimit(2)
                                    .font(.body)
                                    .foregroundColor(.red)
                                
                                Text(trailer.published_at.prefix(10))
                                    .font(.footnote)
                            }
                        }
                    }
                }
                
                
                //Imagen
                AsyncImage(url: URL(string: "\(Constants.ulrImages)\(movie.backdrop_path ?? "")")){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                
            }
            .onAppear(perform: {
                viewModel.getTrailers(id: movie.id ?? 123)
            })
        }
    }
}




struct YTWrapper: UIViewRepresentable{
 
    var videoId: String
    
    
    func makeUIView(context: Context) -> YTPlayerView {
        let playerView = YTPlayerView()
        playerView.load(withVideoId: videoId)
        return playerView
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        //
    }
    
    
    
}



#Preview {
    MovieDetailView(movie: MockData.movie)
}
