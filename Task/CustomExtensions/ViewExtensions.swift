//
//  ViewExtensions.swift
//  Task
//
//  Created by CEPL on 12/10/22.
//

import Foundation
import SwiftUI

extension View {
    
    func centerHorizontally() -> some View{
        HStack{
            Spacer()
            self
            Spacer()
        }
        
    }
    
}
