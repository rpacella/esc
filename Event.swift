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
    
    var title: String? = ""
    var eventDescription: String
    var tag: String
    var startTime: String
    var endTime: String
    var coordinate: CLLocationCoordinate2D
    
    // title, tag, start time, end time, latitude, longitude, description
    
    init(title:String, eventDescription:String, tag:String, startTime:String, endTime:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.eventDescription = eventDescription
        self.tag = tag
        self.startTime = startTime
        self.endTime = endTime
        self.coordinate = coordinate
    }
    
    required init?(coder: NSCoder) {
        title = (coder.decodeObjectForKey("title") as? String ?? "")
        coordinate = CLLocationCoordinate2D(latitude: (coder.decodeObjectForKey("latitude") as? CLLocationDegrees ?? CLLocationDegrees()), longitude: (coder.decodeObjectForKey("longitude") as? CLLocationDegrees ?? CLLocationDegrees()))
        eventDescription = (coder.decodeObjectForKey("eventDescription") as? String ?? "")
        tag = (coder.decodeObjectForKey("tag") as? String ?? "")
        startTime = (coder.decodeObjectForKey("startTime") as? String ?? "")
        endTime = (coder.decodeObjectForKey("endTime") as? String ?? "")
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(title, forKey: "title")
        coder.encodeObject(coordinate.latitude, forKey: "latitude")
        coder.encodeObject(coordinate.longitude, forKey: "longitude")
        coder.encodeObject(eventDescription, forKey: "eventDescription")
        coder.encodeObject(tag, forKey: "tag")
        coder.encodeObject(startTime, forKey: "startTime")
        coder.encodeObject(endTime, forKey: "endTime")
    }
}