//
//  ContentView.swift
//  Task
//
//  Created by CEPL on 10/10/22.
//

import Foundation
import SwiftUI
import CoreData
import Alamofire
import Combine



struct ContentView: View {
    @State private var isPresented: Bool = false
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var jokeListVM: JokeListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var sjoke: String = ""
    
   
    // New
    
    init(vm: JokeListViewModel){
        self.jokeListVM = vm
    }
    
    var body: some View{
        NavigationView{
            VStack{
                Text(sjoke)
                    .font(.system(size: 15))
                    .foregroundColor(Color.black)
                    .padding(15)
                    .onAppear {
                        callFunc()
                    }
                List{
                    ForEach(jokeListVM.jokess){
                        jokes in
                        VStack {
                            NavigationLink(destination: JokeTextView(text: jokes.joke) ) {
                                Text(jokes.joke)
//                                    .gesture(TapGesture()
//                                        .onEnded({ _ in
//                                            //your action here
//                                           // JokeTextView(text: jokes.joke)
//                                }))
                            }
                        }
                    }
                }.padding(20)
            }
            .navigationTitle("Jokes")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Fetch Jokes!!!"){
                       // isPresented = true
                        callAPI()
                    }.frame(width: 130, height: 50)
                        .background(Color.white)
                }
            }
        }
        
    }

    func callFunc() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                    print("-----> callFunc")
                    // You can change here time delay
                    //  Auto Call API after 30 Second
                    callAPI()
                    
                    // Repeated Call of DispatchQueue function
                    callFunc()
                }
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
                   jokeListVM.joke = sjoke
                   jokeListVM.save()
                   presentationMode.wrappedValue.dismiss()
               }
           }
       }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.presistentStoreContainer.viewContext
        ContentView(vm: JokeListViewModel(context: viewContext))
    }
}


struct JokeTextView : UIViewRepresentable{
    // Normal implemantation of UIKit
    
    var text: String
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.font = UIFont.systemFont(ofSize: 30)
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        print(text)
    }
}

struct TestControllerView : UIViewControllerRepresentable {

     func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
     }

     func makeUIViewController(context: Context) -> some UIViewController {

         // if you want to call any StoryBoard Controller you can use this
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "JokesViewController") as? JokesViewController else {
            fatalError("ViewController not implemented in storyboard")
        }
    
        return viewController
     }
}


