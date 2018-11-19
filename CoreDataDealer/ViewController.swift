//
//  ViewController.swift
//  CoreDataDealer
//
//  Created by Morales, Angel (MX - Mexico) on 19/11/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var summaryLabel: UILabel! {
        didSet {
            summaryLabel.text = "Intento: \(0)\r\nRegistros en la base: \(0)\r\nÚltimo registro: nil"
        }
    }
    
    
    @IBAction func createRecords(_ sender: UIButton) {
    }
    
    @IBAction func deleteRecords(_ sender: UIButton) {
    }
    
    @IBAction func fetchLastRecord(_ sender: UIButton) {
    }


}

