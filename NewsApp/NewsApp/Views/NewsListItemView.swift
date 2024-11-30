//
//  NewsListItemView.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 28/11/24.
//

import SwiftUI

struct NewsListItem: View {
    var news: NewsViewModel
    
    @State private var isNavigationActive: Bool = false

    var body: some View {

            ZStack {
                if let url = URL(string: news.urlToImage) {
                    AsyncImage(url: url){ result in
                        result.image?
                            .resizable()
                            .scaledToFill()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .opacity(0.6)
                } else {
                    Image(systemName:"photo.badge.exclamationmark")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .opacity(0.6)
                }
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .cornerRadius(10)
                    .onTapGesture {
                        isNavigationActive = true
                    }
                HStack(spacing: 8) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(news.title)
                            .bold()
                            .lineLimit(2)
                            .foregroundColor(Color.white)
                        Text(news.description)
                            .font(.caption)
                            .lineLimit(3)
                            .foregroundColor(Color.white)
                    }
                    Spacer(minLength: 1)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .onTapGesture {
                    isNavigationActive = true
                }
            }
            .background(NavigationLink(destination: isNavigationActive ? NewsDetailView(news: news) : nil, isActive: $isNavigationActive) {
                EmptyView()
            })
            .shadow(radius: 4)
            .frame(height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
}

#Preview {
    NewsListItem(news: NewsViewModel(news: NewsModel(source: NewsSource(id: "1", name: "Name"), author: "Author", title: "Title", description: "Description", url: "", urlToImage: "https://arc.stimg.co/startribunemedia/MDQM7UCTFVHG7EJQFPRZBGLJOI.jpg?&w=1200&ar=1.91:1&fit=crop")))
}
