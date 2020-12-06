//
//  DataManagerProtocol.swift
//  PopCornTime
//
//  Created by vakhushti metreveli on 05.12.20.
//

import CoreData

protocol DataManagerProtocol {
    func deleteAllFavorites()
    func deleteFavorite(by id: Int32)
    func saveFavorites(with models: [PopularMovieModel])
    func getFavoritesFetchController() -> [Favorites]
    func getFavorites(by id: Int32) -> Favorites?
    
}


class DataManager: DataManagerProtocol {
    
    let persistentContainer: NSPersistentContainer
    
    let FAVORITE_ENTITY_NAME = "Favorites"
    
    //==============================================================================
    
    init() {
        let container = NSPersistentContainer(name: "Model")
        persistentContainer = container
        
        container.loadPersistentStores { storeDesription, error in
            guard error == nil else {
                fatalError("Unresolved error \(error!)")
            }
            
            container.viewContext.automaticallyMergesChangesFromParent = false
            container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            container.viewContext.undoManager = nil
            container.viewContext.shouldDeleteInaccessibleFaults = true
            
            container.persistentStoreDescriptions.forEach { storeDesc in
                storeDesc.shouldMigrateStoreAutomatically = true
                storeDesc.shouldInferMappingModelAutomatically = true
            }
        }
    }
    
    
    func deleteAllFavorites() {
        deleteAllNonBulkEntities(entityName: FAVORITE_ENTITY_NAME)
    }
    
    func deleteFavorite(by id: Int32){
        deletebyId(id: id, entityName: FAVORITE_ENTITY_NAME)
    }
    
    func saveFavorites(with models: [PopularMovieModel]) {
        let context = persistentContainer.viewContext
        
        for model in models {
            let favoriteModel = NSEntityDescription.insertNewObject(forEntityName: FAVORITE_ENTITY_NAME, into: context) as! Favorites
            favoriteModel.config(with: model)
        }
        context.saveContext()
    }
    
    func getFavoritesFetchController() -> [Favorites] {
        let context = persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: FAVORITE_ENTITY_NAME)
       // let sortOrderDescriptor = NSSortDescriptor(key: "sortOrderId", ascending: true)
        
       // fetch.sortDescriptors = [sortOrderDescriptor]
        do {
            let movies = try context.fetch(fetch) as! [Favorites]
            
            return movies
        } catch {
            return []
        }
    }
    
    func getFavorites(by id: Int32) -> Favorites? {
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: FAVORITE_ENTITY_NAME)
        fetch.returnsObjectsAsFaults = false
        let predicate = NSPredicate(format: "id == %ld",id)
        fetch.fetchLimit = 1
        fetch.predicate = predicate
        do {
            let model = try persistentContainer.viewContext.fetch(fetch) as! [Favorites]
            return model.first
        } catch {
            return nil
        }
    }
    
    
    
}


extension DataManager {
    private func deleteAllNonBulkEntities(entityName: String){
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            guard let objects = try context.fetch(fetchRequest) as? [NSManagedObject] else { return }
            for object in objects {
                context.delete(object)
            }
        } catch { print(error) }
    }
    
    private func deletebyId(id: Int32, entityName: String){
        let context = persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: FAVORITE_ENTITY_NAME)
        fetch.returnsObjectsAsFaults = false
        let predicate = NSPredicate(format: "id == %ld",id)
        fetch.fetchLimit = 1
        fetch.predicate = predicate
        do {
            guard let model = try persistentContainer.viewContext.fetch(fetch) as? [Favorites] else { return }
            context.delete(model.first!)
            try context.save()
        } catch {
            print(error)
        }
    }
    
    
    
}

extension NSManagedObjectContext {
    
    func saveContext() {
        do {
            try save()
        } catch {
            print("Failure to save context: \(error)")
        }
    }
}

