//
//  Jokes+Extensions.swift
//  Task
//
//  Created by CEPL on 12/10/22.
//

import Foundation
import CoreData

extension Jokes: BaseModel {
    
    static var all: NSFetchRequest<Jokes>{
        let request = Jokes.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(
            keyPath: \Jokes.joke,
            ascending: true)]
        request.fetchLimit = 10
        return request
    }
    
}
