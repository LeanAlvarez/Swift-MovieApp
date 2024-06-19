//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Lean on 18/06/2024.
//

import Foundation


class MoviesViewModel: ObservableObject {
    @Published var upcomingMovies: [DataMovie] = []
    
    init(){
        getListUpcomingMovies()
    }
    
    func getListUpcomingMovies() {
        NetworkManager.shared.getListUpcomingMovies { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let movies):
                self.upcomingMovies = movies
            case .failure(let error):
                switch error {
                case .invalidURL:
                    print("Error invalidURL")
                case .unableToComplete:
                    print("Error unableToComplete")
                case .invalidResponse:
                    print("Error invalidResponse")
                case .invalidData:
                    print("Error invalidData")
                case .decodingError:
                    print("Error decodingError")
                }
            }
        }
    }
    
    
}
