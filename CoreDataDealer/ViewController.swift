//
//  ViewController.swift
//  CoreDataDealer
//
//  Created by Morales, Angel (MX - Mexico) on 19/11/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let manager = CoreDataManager()
    var counter = 0
    @IBOutlet weak var summaryLabel: UILabel! {
        didSet {
            summaryLabel.text = "Intento: \(counter)\r\nRegistros en la base: \(0)\r\nÚltimo registro: nil"
        }
    }

    
    @IBAction func createRecords(_ sender: UIButton) {
        manager.createUser(name: "Juan", lastName: "Perez", email: "juanperez@mail.com", initialAmount: 2000.50) { [weak self] in
            self?.updateUI()
        }
    }
    
    @IBAction func deleteRecords(_ sender: UIButton) {
        manager.deleteUsers()
        counter = -1
        updateUI()
    }
    
    @IBAction func fetchLastRecord(_ sender: UIButton) {
        
    }

    func updateUI() {
        counter = counter + 1
        let users = manager.fetchUsers()
        summaryLabel.text = "Intento: \(counter) \r\nRegistros en la base: \(users.count) \r\nÚltimo registro: \(users.last?.name)"
        
    }
}

