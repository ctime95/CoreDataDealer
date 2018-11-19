//
//  CoreDataManager.swift
//  CoreDataDealer
//
//  Created by Morales, Angel (MX - Mexico) on 19/11/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    private let container : NSPersistentContainer!

    init() {
        container = NSPersistentContainer(name: "Banking")
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) - \(error)")
                return
            }
            print("Database ready!")
        }
    }
    
}
