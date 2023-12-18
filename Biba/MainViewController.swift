//
//  MainViewController.swift
//  Biba
//
//  Created by Andy Wu on 2023/12/17.
//

import UIKit
import FirebaseFirestore

class MainViewController: UIViewController {
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        print("Biba is running 😃")
    
        let docRef = db.collection("debug").document("env")
        
        docRef.getDocument { (document, error) in
          if let document = document, document.exists {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Document data: \(dataDescription)")
          } else {
            print("Document does not exist")
          }
        }
    }
}
