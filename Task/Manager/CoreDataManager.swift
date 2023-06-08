//
//  CoreDataManager.swift
//  Task
//
//  Created by CEPL on 12/10/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let presistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init(){
        presistentStoreContainer = NSPersistentContainer(name: "JokesAppModel")
        presistentStoreContainer.loadPersistentStores{ (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
