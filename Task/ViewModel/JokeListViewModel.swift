//
//  JokeListViewModel.swift
//  Task
//
//  Created by CEPL on 12/10/22.
//

import Foundation
import SwiftUI
import CoreData

@MainActor
class JokeListViewModel: NSObject, ObservableObject{
    @Published var jokess = [JokesViewModel]()
    @Published var joke: String = ""
    
    private let fetchResultController: NSFetchedResultsController<Jokes>
    
    private (set) var context: NSManagedObjectContext
    
    
    
  
    init(context: NSManagedObjectContext){
        self.context = context
        fetchResultController = NSFetchedResultsController(fetchRequest: Jokes.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchResultController.delegate = self
        do{
            try fetchResultController.performFetch()
            
            guard let jokess = fetchResultController.fetchedObjects else {
                return
            }
            self.jokess = jokess.map(JokesViewModel.init)
        }catch{
            print(error)
        }
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

extension JokeListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let jokess  = controller.fetchedObjects as? [Jokes] else{
            return
        }
        self.jokess = jokess.map(JokesViewModel.init)
    }
}

struct JokesViewModel: Identifiable{
    private var jokes: Jokes
    
    init(jokes: Jokes){
        self.jokes = jokes
    }
    
    var id: NSManagedObjectID{
        jokes.objectID
    }
    
    var joke: String{
        jokes.joke ?? ""
    }
}
