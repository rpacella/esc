//
//  Event.swift
//  
//
//  Created by Larissa Clopton on 7/20/16.
//
//

import UIKit
import MapKit
import CoreLocation

class Event: NSObject, NSCoding, MKAnnotation {
    
    var image: UIImage?
    var title: String?
    var eventDescription: String
    var tags: String?
    var startTime: String?
    var endTime: String?
    var coordinate = CLLocationCoordinate2D()
    
    init(title:String, coordinate:CLLocationCoordinate2D, eventDescription:String, tags:String, startTime:String, endTime:String) {
        self.title = title
        self.coordinate = coordinate
        self.eventDescription = ""
        self.tags = ""
        self.startTime = ""
        self.endTime = ""
    }
    
    required init?(coder: NSCoder) {
        title = (coder.decodeObjectForKey("title") as? String ?? "")
        coordinate = CLLocationCoordinate2D(latitude: (coder.decodeObjectForKey("latitude") as? CLLocationDegrees ?? CLLocationDegrees()), longitude: (coder.decodeObjectForKey("longitude") as? CLLocationDegrees ?? CLLocationDegrees()))
        eventDescription = (coder.decodeObjectForKey("eventDescription") as? String ?? "")
        tags = (coder.decodeObjectForKey("tags") as? String ?? "")
        startTime = (coder.decodeObjectForKey("startTime") as? String ?? "")
        endTime = (coder.decodeObjectForKey("endTime") as? String ?? "")
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(title, forKey: "title")
        coder.encodeObject(coordinate.latitude, forKey: "latitude")
        coder.encodeObject(coordinate.longitude, forKey: "longitude")
        coder.encodeObject(eventDescription, forKey: "eventDescription")
        coder.encodeObject(tags, forKey: "tags")
        coder.encodeObject(startTime, forKey: "startTime")
        coder.encodeObject(endTime, forKey: "endTime")
    }
}