//
//  TripController.swift
//  esc
//
//  Created by Larissa Clopton on 7/20/16.
//  Copyright © 2016 Escape. All rights reserved.
//
//
//    
import UIKit
import CoreLocation

class TripController {
    
    static var sharedInstance = TripController()
    var currentTrips = [Trip]()
    
    private init(){
        
        let manager = NSFileManager.defaultManager()
        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        do {
            let availableTrips = try manager.contentsOfDirectoryAtURL(documents, includingPropertiesForKeys: nil, options: [])
            for aTrip in availableTrips {
                if let trip = NSKeyedUnarchiver.unarchiveObjectWithFile(aTrip.path!) as? Trip {
                    currentTrips.append(trip)
                }
            }
            
        }
        catch {
            // do nothing
        }
    }
    
    func returnTrip() -> Trip {
        
        let newTrip = Trip()
        
        let event1 = Event(title: "Jarryds", eventDescription: "Cafe", tag: "Dining", startTime: "10:00", endTime: "11:00", coordinate: CLLocationCoordinate2D(latitude: -33.111, longitude: 18.112))
        
        newTrip.eventList.append(event1)
        
        let event2 = Event(title: "Platteklip Gorge", eventDescription: "Hike on Table Mountain", tag: "Outdoors", startTime: "11:00", endTime: "14:00", coordinate: CLLocationCoordinate2D(latitude: -33.112, longitude: 18.113))
        
        newTrip.eventList.append(event2)
        
        let event3 = Event(title: "Greenhouse", eventDescription: "Deli", tag: "Dining", startTime: "14:00", endTime: "15:30", coordinate: CLLocationCoordinate2D(latitude: -33.113, longitude: 18.114))
        
        newTrip.eventList.append(event3)
        
        let event4 = Event(title: "The Piano Bar", eventDescription: "Jazz and music bar", tag: "Nightlife", startTime: "15:30", endTime: "19:00", coordinate: CLLocationCoordinate2D(latitude: -33.114, longitude: 18.115))
        
        newTrip.eventList.append(event4)
        
        let event5 = Event(title: "Rocomamas", eventDescription: "Grab a burger", tag: "Dining", startTime: "19:00", endTime: "21:00", coordinate: CLLocationCoordinate2D(latitude: -33.115, longitude: 18.116))
        
        newTrip.eventList.append(event5)
        
        return newTrip
     
        
    }
    
}
