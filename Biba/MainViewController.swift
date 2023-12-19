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
    
    let label = UILabel()
    
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 30,weight: .medium)
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        label.text = "\(Config.environment)"
        if Config.environment == "正式環境"{
            view.backgroundColor = .white
            label.textColor = .black
        }else if Config.environment == "測試環境"{
            view.backgroundColor = .black
            label.textColor = .white
        }else{
            fatalError("Config.environment missing")
        }
    }
}
