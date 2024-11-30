//
//  NewsDetailWebView.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 29/11/24.
//

import SwiftUI
import SafariServices

struct NewsDetailWebView : UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NewsDetailWebView>) -> SFSafariViewController {
        let webView = SFSafariViewController(url: url)
        webView.preferredControlTintColor = UIColor.black
        return webView
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<NewsDetailWebView>) {}
}
