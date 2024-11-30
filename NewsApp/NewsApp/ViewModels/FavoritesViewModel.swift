//
//  FavoritesViewModel.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 29/11/24.
//

import Foundation

class FavoritesViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let favorites: NewsModel
    
    init(news: NewsModel) {
        self.favorites = news
    }

    var author: String {
        favorites.author ?? "Unknown Author"
    }

    var title: String {
        favorites.title ?? "No Title"
    }

    var description: String {
        favorites.description ?? "No Description"
    }

    var url: String {
        favorites.url ?? ""
    }

    var urlToImage: String {
        favorites.urlToImage ?? ""
    }
    
    var publishedAt: String {
        favorites.publishedAt ?? ""
    }
    
    func getFormattedPublishedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: publishedAt) {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            return dateFormatter.string(from: date)
        }
        else { return "" }
    }
}
