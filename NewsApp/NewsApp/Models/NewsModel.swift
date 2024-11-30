//
//  NewsModel.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 28/11/24.
//

import Foundation

struct NewsModel: Decodable {
    var source: NewsSource?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
}

struct NewsSource: Decodable {
    var id: String?
    var name: String?
}

struct NewsResponse: Decodable {
    var status: String
    var articles: [NewsModel]
}
