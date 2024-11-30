## News App - An iOS Application

This document provides an overview of the News Reader Demo app, a sample iOS application designed to showcase skils of development.

**Project Description**

This app allows users to browse through news articles from a public API, read full content details, bookmark articles for later reading, and filter news by category.

**Technical Stack**

- **SwiftUI:** Declarative UI framework for building user interfaces.
- **Core Data:** Framework for managing persistent data storage.
- **MVVM Architecture:** Model-View-ViewModel architecture for separation of concerns.

**Features:**

- Browse news articles with titles, descriptions, and images.
- Read full content of articles.
- Bookmark articles for offline access.
- Filter news by category.
- Read full article in internal webview inside application.

**Implementation Highlights:**

- **Smooth user experience:** Utilizes asynchronus operations to handle data fetching and updating the UI.
- **Dark mode support:** Application supports both light and dark mode according to user convinience.
- **Persistent Data Storage:** Leverages Core Data to store bookmarked articles.
- **Clean and Maintainable Code:** Adheres to best practices like MVVM.

**Getting Started**

1. Clone this repository.
2. Ensure you have Xcode installed with the latest iOS and Swift versions.
3. Open the project file (`NewsApp.xcodeproj`).
4. Replace `YOUR_NEWS_API_KEY` in `Constants.swift` with your actual News API key.
5. Build and run the app on your iOS device or simulator.

**TODOs**

- Enhance the UI with custom components and animations.
- Implement user authentication and personalization features.
- Implement paging to load the images on demand by fetching data in parts

**License**

(Include your chosen open-source license here, e.g., MIT License)

**Feel free to contribute to this project by creating pull requests with new features or improvements!**
