//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 28/11/24.
//

import Foundation

class NewsViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let news: NewsModel
    
    init(news: NewsModel) {
        self.news = news
    }

    var author: String {
        news.author ?? "Unknown Author"
    }

    var title: String {
        news.title ?? "No Title"
    }

    var description: String {
        news.description ?? "No Description"
    }

    var url: String {
        news.url ?? ""
    }

    var urlToImage: String {
        news.urlToImage ?? ""
    }
    
    var publishedAt: String {
        news.publishedAt ?? ""
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
