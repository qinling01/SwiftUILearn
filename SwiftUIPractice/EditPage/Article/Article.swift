//
//  Article.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import CoreData
import SwiftUI
//import Combine

final class Article: NSManagedObject, Identifiable {
    @NSManaged var content: String
    @NSManaged var bid: UUID
    @NSManaged var avatarColor: Int16
    @NSManaged internal var createdAt: Date
    
    static func insert(viewModel: Article.ViewModel) -> Article {
        let p_article: Article = QLCoreData.shared.persistentContainer.viewContext.insertObject()
        p_article.content = viewModel.content
        p_article.avatarColor = Int16(viewModel.avatarColor)
        p_article.bid = UUID()
        p_article.createdAt = Date()
        p_article.createdAt = viewModel.createdAt
        
        return p_article
    }
    
    func delete() {
        QLCoreData.shared.persistentContainer.viewContext.performChanges {
            QLCoreData.shared.persistentContainer.viewContext.delete(self)
        }
    }
}

extension Article: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        // 根据「创建时间」降序
        return [NSSortDescriptor(key: #keyPath(createdAt), ascending: false)]
    }
}


extension Article {
    struct ViewModel {
        var content: String
        var avatarColor: Int
        var createdAt: Date
        
        init() {
            content = ""
            avatarColor = -1
            createdAt = Date()
        }
    }
}
