//
//  AddJokeViewModel.swift
//  Task
//
//  Created by CEPL on 12/10/22.
//

import Foundation
import SwiftUI
import CoreData

class AddJokeViewModel: ObservableObject {
    
    @Published var joke: String = ""
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func save(){
        do{
            let jokes = Jokes(context : context)
            jokes.joke = joke
            try jokes.save()
        }catch{
            print(error)
        }
    }
    
}
