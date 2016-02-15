//
//  LABCoreData.swift
//  LazyBastard
//
//  Created by Ondrej Rafaj on 12/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import CoreData


class LABCoreData : NSObject {
    
    static let sharedInstance = LABCoreData()
    
    
    // MARK: Public core data handlers
    
    static internal func saveContext() {
        self.sharedInstance.saveContext()
    }
    
    static internal func tasks() -> [LABTask]? {
        let fetchRequest = NSFetchRequest(entityName: "Task")
        do {
            let results = try self.sharedInstance.managedObjectContext.executeFetchRequest(fetchRequest)
            return results as? [LABTask]
        }
        catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return nil
    }
    
    static internal func newEvent(points: Int16, task: LABTask?) -> LABEvent {
        let entity =  NSEntityDescription.entityForName("Event", inManagedObjectContext:self.sharedInstance.managedObjectContext)
        let object: LABEvent = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.sharedInstance.managedObjectContext) as! LABEvent
        
        object.points = points
        object.date = NSDate.init()
        object.task = task
        
        return object
    }
    
    static internal func newEvent(points: Int16) -> LABEvent {
        return self.newEvent(points, task: nil)
    }
    
    static internal func newTask(task: String, points: Int16, when: NSDate?) -> LABTask {
        let entity =  NSEntityDescription.entityForName("Task", inManagedObjectContext:self.sharedInstance.managedObjectContext)
        let object: LABTask = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.sharedInstance.managedObjectContext) as! LABTask
        
        object.task = task
        object.points = points
        object.added = NSDate.init()
        object.when = when
        object.done = false
        object.events = nil
        
        return object
    }
    
    // MARK: Private core data methods
    
    private lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.ridiculous-innovations.LazyBastard" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("LazyBastard", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        }
        catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    private lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    private func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            }
            catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    
}