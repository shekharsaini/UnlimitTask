//
//  TaskApp.swift
//  Task
//
//  Created by CEPL on 10/10/22.
//

import SwiftUI

@main
struct TaskApp: App {
    var body: some Scene {
        WindowGroup {
            // Create instant of CoreData
    
            let viewContext = CoreDataManager.shared.presistentStoreContainer.viewContext
            ContentView(vm: JokeListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
