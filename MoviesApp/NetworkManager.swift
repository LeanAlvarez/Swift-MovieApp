//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Lean on 18/06/2024.
//

import UIKit

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}


class NetworkManager: NSObject {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    
    static let upcoming = "https://api.themoviedb.org/3/movie/upcoming?api_key=d8e739050b2edf0865076a9b949b7042&language=es-MX&page=1"
    
    static let nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=d8e739050b2edf0865076a9b949b7042&language=es-MX&page=1"
    
    static let trending = "https://api.themoviedb.org/3/trending/all/day?api_key=d8e739050b2edf0865076a9b949b7042"
    
    
    //obtiene lista de upcomings
    func getListUpcomingMovies(completed: @escaping (Result<[DataMovie], APError>) -> Void){
        guard let url = URL(string: NetworkManager.upcoming) else {
            completed(.failure(.invalidURL))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MovieDataModel.self, from: data)
                completed(.success(decodedResponse.results))
                
            }catch {
                print("Debug: error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
            
            
        }
        task.resume()
        
        
    }
    
    // obtiene la lista de los que estan en cartelera
    func getMoviesNowPlaying(completed: @escaping (Result<[DataMovie], APError>) -> Void){
        guard let url = URL(string: NetworkManager.nowPlaying) else {
            completed(.failure(.invalidURL))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MovieDataModel.self, from: data)
                completed(.success(decodedResponse.results))
                
            }catch {
                print("Debug: error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
            
            
        }
        task.resume()
        
        
    }
    
    
    //obtiene la lista de trendings
    func getTrendingMovies(completed: @escaping (Result<[DataMovie], APError>) -> Void){
        guard let url = URL(string: NetworkManager.trending) else {
            completed(.failure(.invalidURL))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MovieDataModel.self, from: data)
                completed(.success(decodedResponse.results))
                
            }catch {
                print("Debug: error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
            
            
        }
        task.resume()
        
        
    }
    
    
    //obtiene trailers
    func getListOfTrailers(id: Int, completed: @escaping(Result<[Trailer], APError>) -> Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=d8e739050b2edf0865076a9b949b7042&language=es_MX") else {
            completed(.failure(.invalidURL))
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(TrailerResponse.self, from: data)
                completed(.success(decodedResponse.results))
                
            }catch {
                print("Debug: error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
            
            
        }
        task.resume()
            
            
            
            
        }
        
        
    }
    
    
    
    struct Constants {
        static let ulrImages = "https://image.tmdb.org/t/p/original"
        static let placeholder = "https://cringemdb.com/img/movie-poster-placeholder.png"
        static let urlTrailer = "uxRm9UiJ0PY&t=12s"
    }

