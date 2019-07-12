//
//  Movie+CoreDataProperties.swift
//  
//
//  Created by German Gomez on 7/11/19.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var poster_path: String?
    @NSManaged public var original_title: String?
    @NSManaged public var overview: String?

}
