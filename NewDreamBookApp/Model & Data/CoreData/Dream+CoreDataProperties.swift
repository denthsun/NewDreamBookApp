//
//  Dream+CoreDataProperties.swift
//  NewDreamBookApp
//
//  Created by Denis Velikanov on 27.12.2020.
//
//

import Foundation
import CoreData


extension Dream {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dream> {
        return NSFetchRequest<Dream>(entityName: "Dream")
    }

    @NSManaged public var date: Date?
    @NSManaged public var descript: String?
    @NSManaged public var duration: String?
    @NSManaged public var rating: Int16
    @NSManaged public var theme: String?

}

extension Dream : Identifiable {

}
