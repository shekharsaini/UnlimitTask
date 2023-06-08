//
//  AddJokeScreen.swift
//  Task
//
//  Created by CEPL on 12/10/22.
//

import Foundation
import SwiftUI
import CoreData
import Alamofire

struct AddJokeScreen: View {
    
    
    @ObservedObject var vm: AddJokeViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var sjoke: String = ""
    
    init(vm: AddJokeViewModel){
        self.vm = vm
    }
     
    var body: some View{
        Form{
           // TextField("Enter Jokes", text: $vm.joke)
            
            Button("Save"){
                callAPI()
            }.centerHorizontally()
            
            .navigationTitle("Fetch Jokes!!!")
        }
        
        Text("Hello")
    }
    
    func callAPI() {
            
           // Api Request
           AF.request("https://geek-jokes.sameerkumar.website/api").response {
               response in
               var json = response.data
               debugPrint(response)
               if let data = response.data {
                   // Convert respponse data in String by using Encoding.utf8
                   sjoke = String(data: data, encoding: String.Encoding.utf8) ?? ""
                   print(sjoke)
                   vm.joke = sjoke
                   vm.save()
                   presentationMode.wrappedValue.dismiss()
               }
           }
       }
    
}



struct AddJokeScreen_Previews: PreviewProvider{
    static var previews: some View{
        let viewContext = CoreDataManager.shared.presistentStoreContainer.viewContext
        NavigationView{
            AddJokeScreen(vm: AddJokeViewModel(context: viewContext))
        }
    }
}
