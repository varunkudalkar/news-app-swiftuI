//
//  Constant.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 30/11/24.
//

struct Constants {
    struct API {
        static let baseURL = "https://newsapi.org/v2/"
        static let headline = "top-headlines"
        static let APIKey = "a008f326769f4f45913e6ab7c2752cd3"
    }
    
    struct CoreData {
        static let storeName = "NewsApp"
    }
    
    enum NewsCategory: String, CaseIterable {
        case general
        case business
        case entertainment
        case health
        case science
        case sports
        case technology
    }
}
