//
//  LABEvent+CoreDataProperties.swift
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

extension LABEvent {

    @NSManaged var serverId: Int64
    @NSManaged var points: Int16
    @NSManaged var date: NSDate?
    @NSManaged var task: LABTask?

}
