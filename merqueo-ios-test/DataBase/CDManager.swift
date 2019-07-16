//
//  CDManager.swift
//  merqueo-ios-test
//
//  Created by German Gomez on 7/15/19.
//  Copyright © 2019 German Gomez. All rights reserved.
//

import Foundation
import CoreData

class CDManager: NSObject {
  
  static let sharedDatabaseManager = CDManager()
  
  let persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "merqueo_ios_test")
    container.loadPersistentStores(completionHandler: { (persistentStoreDescription, error) in
      if error != nil {
        print("Encountered an error while loading persistent container - \(error?.localizedDescription)")
      } else {
        print(persistentStoreDescription)
      }
    })
    return container
  }()
  
  func saveContext() {
    if persistentContainer.viewContext.hasChanges {
      do {
        try persistentContainer.viewContext.save()
      } catch {
        print("Encountered an error while saving - \(error.localizedDescription)")
      }
    }
  }
  
}
