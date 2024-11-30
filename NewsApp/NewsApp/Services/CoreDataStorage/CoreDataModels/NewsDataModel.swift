//
//  NewsDataModel.swift
//  NewsApp
//
//  Created by Varun Kudalkar on 29/11/24.
//

import Foundation
import CoreData

@objc(NewsDataModel)
class NewsDataModel: NSManagedObject, Identifiable{
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<NewsDataModel> {
        return NSFetchRequest<NewsDataModel>(entityName: "NewsDataModel")
    }

    @NSManaged var title: String
    @NSManaged var author: String
    @NSManaged var desc: String
    @NSManaged var url: String
    @NSManaged var urlToImage: String
    @NSManaged var publishedAt: String
    @NSManaged var savingDate: Date
    
    static func getAllSavedNews() -> [NewsDataModel] {
        let fetchRequest = fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "savingDate", ascending: false)]
        return (try? CoreDataManager.shared.managedObjectContext.fetch(fetchRequest)) ?? []
    }
    
    static func saveNews(_ news: NewsModel) {
        let localData = NewsDataModel(context: CoreDataManager.shared.managedObjectContext)
        localData.title = news.title ?? ""
        localData.author = news.author ?? ""
        localData.desc = news.description ?? ""
        localData.url = news.url ?? ""
        localData.urlToImage = news.urlToImage ?? ""
        localData.publishedAt = news.publishedAt ?? ""
        localData.savingDate = Date()
    }
    
    static func isAlreadySaved(_ news: NewsModel) -> Bool {
        let fetchRequest = fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "(title == %@) AND (author == %@) AND (desc == %@)", news.title ?? "", news.author ?? "", news.description ?? "")
        fetchRequest.includesPropertyValues = false
        let context = CoreDataManager.shared.managedObjectContext
        let objects = (try? context.fetch(fetchRequest)) ?? []
        return objects.count > 0
    }
    
    static func deleteNews(_ news: NewsModel) {
        let fetchRequest = fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "(title == %@) AND (author == %@) AND (desc == %@)", news.title ?? "", news.author ?? "", news.description ?? "")
        fetchRequest.includesPropertyValues = false
        let context = CoreDataManager.shared.managedObjectContext
        let objects = (try? context.fetch(fetchRequest)) ?? []
        for object in objects {
            context.delete(object)
        }
    }
}
