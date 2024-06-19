//
//  MovieDataModel.swift
//  MoviesApp
//
//  Created by Lean on 18/06/2024.
//

import Foundation


struct MovieDataModel: Codable {
    let results: [DataMovie]
}

struct DataMovie: Codable {
    
    let backdrop_path: String?
    let id: Int?
    let original_title: String?
    let overview: String?
    let original_language: String?
    let title: String?
    let release_date: String?
    let poster_path: String?
    
    
}

struct MockData {
    static let movie = DataMovie(backdrop_path: "/coATv42PoiLqAFKStJiMZs2r6Zb.jpg", id: 573435, original_title: "Inside Out 2", overview: "Una aventura completamente nueva dentro de la cabeza adolescente de Riley que presenta un nuevo conjunto de emociones.", original_language: "en", title: "IntensaMente 2", release_date: "2024-06-11", poster_path: "/2PuAY3xSvbchQWqpSiXw08Yt0NP.jpg")
    
    static let idTrailer = "uI5rezDfDqI"
}
