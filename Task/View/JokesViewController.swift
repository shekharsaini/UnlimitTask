//
//  JokesViewController.swift
//  Task
//
//  Created by CEPL on 14/10/22.
//

import Foundation
import UIKit


class JokesViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func btnBackClicked(_ sender : UIButton) {
            self.dismiss(animated: true, completion: nil)
        }
}
