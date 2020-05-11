//
//  QLCoreData.swift
//  SwiftUIPractice
//
//  Created by Mac on 2020/5/8.
//  Copyright © 2020 灵 Q. All rights reserved.
//

import CoreData

class QLCoreData {
    static let shared = QLCoreData()
    var persistentContainer: NSPersistentCloudKitContainer!
    
    /// 创建一个存储容器
    class func createMASDataModel(completion: @escaping () -> ()) {
        // 名字要与 `.xcdatamodeleld` 文件名一致
        let container = NSPersistentCloudKitContainer(name: "SwiftUIPractice")
        
        container.loadPersistentStores { (storeDescription, err) in
            guard err == nil else { fatalError("Failed to load store: \(err!)") }
            DispatchQueue.main.async {
                print("........",storeDescription)
                self.shared.persistentContainer = container
                completion()
            }
        }
    }
}
