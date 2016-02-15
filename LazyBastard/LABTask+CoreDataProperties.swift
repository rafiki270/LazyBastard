//
//  LABTask+CoreDataProperties.swift
//  
//
//  Created by Ondrej Rafaj on 11/02/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension LABTask {
    
    @NSManaged var serverId: Int64
    @NSManaged var added: NSDate?
    @NSManaged var task: String?
    @NSManaged var points: Int16
    @NSManaged var done: Bool
    @NSManaged var when: NSDate?
    @NSManaged var events: NSSet?

}
