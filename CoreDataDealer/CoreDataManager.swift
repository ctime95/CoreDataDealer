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
    
    func createUser(name : String, lastName : String, email : String, initialAmount : Double, completion: @escaping() -> Void) {
        
        let context = container.viewContext
        
        let user = User(context: context)
        user.name = name
        user.lastName = lastName
        user.email = email
        
        let account = Account(context: context)
        account.name = "Cuenta de \(name)"
        account.amount = initialAmount
        account.openingDate = Date()
        account.belongsTo = user
        
        do {
            try context.save()
            print("Usuario \(name) guardado")
            completion()
        } catch {
            print("Error guardando usuario - \(error)")
        }
        
    }
    
    func fetchUsers() -> [User] {
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("El error obteniendo usuario(s) \(error)")
        }
        return []
    }
    
    func deleteUsers() {
        let context = container.viewContext
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        let deleteBatch = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        do {
            try context.execute(deleteBatch)
            print("Exito borrando usuarios")
        } catch {
            print("Error Borrando los usuarios \(error)")
        }
        context.reset()
    }

}
