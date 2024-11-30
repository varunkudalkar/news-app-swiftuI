//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 28/11/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func getNews(category: String, completion: @escaping (Result<[NewsModel]?,NewsError>) -> Void ) {
        let urlString = "\(Constants.API.baseURL)\(Constants.API.headline)?category=\(category)&apiKey=\(Constants.API.APIKey)"
    
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                return completion(.failure(.noData))
            }
            
            let newsResponse = try? JSONDecoder().decode(NewsResponse.self, from: data)
            newsResponse == nil ? completion(.failure(.dataParseError)) : completion(.success(newsResponse!.articles))
        }.resume()
    }
    
    func getImages(urlString: String, completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                return completion(nil)
            }
            completion(data)
        }.resume()
    }
}


enum NewsError : Error {
    case badUrl
    case noData
    case dataParseError
}

/*
 - some : "{\"status\":\"error\",\"code\":\"rateLimited\",\"message\":\"You have made too many requests recently. Developer accounts are limited to 100 requests over a 24 hour period (50 requests available every 12 hours). Please upgrade to a paid plan if you need more requests.\"}"
 */

//TODO: 1. error handling, 2. endpoint constant file

