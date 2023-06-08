//
//  BaseModel.swift
//  Task
//
//  Created by CEPL on 12/10/22.
//

import Foundation
import CoreData
import SwiftUI

protocol BaseModel {
    static var viewContext: NSManagedObjectContext { get }
    
    func save() throws
    func delete() throws
}


extension BaseModel {
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.presistentStoreContainer.viewContext
        
    }
    
    func save() throws{
        try Self.viewContext.save()
    }
    
    func delete() throws{
        Self.viewContext.delete(self as! NSManagedObject)
        try save()
        
    }
    
}
