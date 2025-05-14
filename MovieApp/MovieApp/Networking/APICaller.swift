//
//  APICaller.swift
//  MovieApp
//
//  Created by Arun Tiwari on 12.05.2025.
//

import Foundation
 
enum NetworkError: Error {
    case urlError
    case canNotParseData
}
 
public class APICaller {
    
    static func getTrendingMovies(currentOffset: Int, limit: Int, completionHandler: @escaping (APIResult<TrendingMovieModel, NetworkError>) -> Void) {
      
        let urlString = NetworkConstant.shared.serverAddress + "/api/edge/anime?page[limit]=\(limit)&page[offset]=\(currentOffset)"
        
        print("My Api ============ \(urlString)")
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse , error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            }
            else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
 
enum APIResult<Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)
}
