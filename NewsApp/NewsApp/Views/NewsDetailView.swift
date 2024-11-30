//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 28/11/24.
//

import SwiftUI

struct NewsDetailView: View {
    var news: NewsViewModel
    @State private var isFavorite: Bool

    init(news: NewsViewModel) {
        self.news = news
        self.isFavorite =         NewsDataModel.isAlreadySaved(news.news)
    }
        
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let url = URL(string: news.urlToImage) {
                    AsyncImage(url: url) { result in
                                result.image?
                                .resizable()
                                .scaledToFit()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                else {
                    Image(systemName:"photo.badge.exclamationmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                HStack{
                    Text(news.author )
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(news.getFormattedPublishedDate())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text(news.title )
                .font(.title2)
                .bold()
                Text(news.description )
                .font(.body)
                if let url = URL(string: news.url) {
                    NavigationLink {
                        NewsDetailWebView(url: url)
                    } label: {
                        VStack{
                            Text("Read full article...")
                            .foregroundColor(Color.blue)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("News Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            Button(action: toggleFavorite) {
                HStack {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                }
                .foregroundColor(.blue)
            }
        }
    }
    

    private func toggleFavorite() {
        if !isFavorite {
            NewsDataModel.saveNews(self.news.news)
            CoreDataManager.shared.saveContext()
        }
        else {
            NewsDataModel.deleteNews(self.news.news)
            CoreDataManager.shared.saveContext()
        }
        isFavorite.toggle()
    }
}

#Preview {
    NewsDetailView(news: NewsViewModel(news: NewsModel(source: NewsSource(id: "1", name: "Name"), author: "Author", title: "Title", description: "Description", url: "", urlToImage: "", publishedAt: "2024-11-28T00:27:37Z")))
}
