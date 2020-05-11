//
//  AritcleManager.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import CoreData
import Combine

class AritcleManager: NSObject, ObservableObject {
    
    var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    var articles: [Article] = []
//    var searchArticles = [Articles]()
    
    fileprivate var fetchedResultsController: NSFetchedResultsController<Article>
    
    override init() {
        let request = Article.sortedFetchRequest
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                                   managedObjectContext: QLCoreData.shared.persistentContainer.viewContext,
                                                                   sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        fetchedResultsController.delegate = self
        
        // 执行方法后，立即返回
        try! fetchedResultsController.performFetch()
        articles = fetchedResultsController.fetchedObjects!
        objectWillChange.send()
    }
}

// MARK: NSFetchedResultsControllerDelegate
extension AritcleManager: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        articles = controller.fetchedObjects as! [Article]
        objectWillChange.send()
    }
}
