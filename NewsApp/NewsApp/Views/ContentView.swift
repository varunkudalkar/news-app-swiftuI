//
//  ContentView.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var newsListViewModel = NewsListViewModel()
    @State var selectedCategory: String = "general"
    
    init() {
        newsListViewModel.load(category: selectedCategory)
    }
    
    var body: some View {
            NavigationView {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(newsListViewModel.newsList) { newsViewModel in
                                NewsListItem(news: newsViewModel)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    .navigationTitle("Top Headlines")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading:
                                            Menu {
                        ForEach(Constants.NewsCategory.allCases, id: \.rawValue) { category in Button {
                            self.selectedCategory = "\(category.rawValue)"
                            DispatchQueue.global(qos: .background).async {
                                newsListViewModel.load(category: selectedCategory)
                            }
                        }
                            label: {
                                Text(category.rawValue.capitalized)
                                if selectedCategory == category.rawValue {
                                    Image(systemName: "checkmark.circle")
                                }
                            }
                        }
                    }
                    label:{
                        VStack{
                            Text(selectedCategory.capitalized).foregroundColor(Color.blue)
                            Image(systemName: "filemenu.and.selection")
                        }
                    })
                    .toolbar {
                        NavigationLink {
                            FavoritesView()
                        } label: {
                            VStack{
                                Text("Favorites").foregroundColor(Color.blue)
                                Image(systemName: "heart.fill")
                            }
                        }
                    }
            }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}
#Preview {
    ContentView()
}
