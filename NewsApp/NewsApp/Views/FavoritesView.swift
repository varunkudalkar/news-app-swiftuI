//
//  FavoritesView.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 28/11/24.
//

import SwiftUI
import CoreData

struct FavoritesView: View {
    @State private var newsListViewModel: [NewsDataModel] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(newsListViewModel, id: \.self) { newsViewModel in
                    NewsListItem(news: NewsViewModel(news: NewsModel(source: nil, author: newsViewModel.author, title: newsViewModel.title, description: newsViewModel.desc, url: newsViewModel.url, urlToImage: newsViewModel.urlToImage, publishedAt: newsViewModel.publishedAt)))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            self.newsListViewModel = NewsDataModel.getAllSavedNews()
            print(self.newsListViewModel)

        }
    }
}

#Preview {
    FavoritesView()
}
