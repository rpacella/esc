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
        
        let event1 = Event(title: "Jarryds", eventDescription: "Cafe", tag: "Dining", startTime: "10:00", endTime: "11:00", coordinate: CLLocationCoordinate2D(latitude: -34.611, longitude: 18.52))
        
        newTrip.eventList.append(event1)
        
        let event2 = Event(title: "Platteklip Gorge", eventDescription: "Hike on Table Mountain", tag: "Outdoors", startTime: "11:00", endTime: "14:00", coordinate: CLLocationCoordinate2D(latitude: -34.712, longitude: 18.43))
        
        newTrip.eventList.append(event2)
        
        let event3 = Event(title: "Greenhouse", eventDescription: "Deli", tag: "Dining", startTime: "14:00", endTime: "15:30", coordinate: CLLocationCoordinate2D(latitude: -34.33, longitude: 18.414))
        
        newTrip.eventList.append(event3)
        
        let event4 = Event(title: "The Piano Bar", eventDescription: "Jazz and music bar", tag: "Nightlife", startTime: "15:30", endTime: "19:00", coordinate: CLLocationCoordinate2D(latitude: -34.114, longitude: 18.495))
        
        newTrip.eventList.append(event4)
        
        let event5 = Event(title: "Rocomamas", eventDescription: "Grab a burger", tag: "Dining", startTime: "19:00", endTime: "21:00", coordinate: CLLocationCoordinate2D(latitude: -34.615, longitude: 18.56))
        
        newTrip.eventList.append(event5)
        
        return newTrip
     
        
    }
    
    func returnTripTwo() -> Trip {
        
        let generatedTrip = Trip()
        
        let events1 = Event(title: "Bacon on Bree", eventDescription: "Cafe", tag: "Dining", startTime: "10:00", endTime: "11:00", coordinate: CLLocationCoordinate2D(latitude: -34.374, longitude: 18.532))
        
        generatedTrip.eventList.append(events1)
        
        let events2 = Event(title: "Bo-Kaap", eventDescription: "Colorful buildings of Cape Town", tag: "Sightsee", startTime: "11:30", endTime: "14:00", coordinate: CLLocationCoordinate2D(latitude: -34.242, longitude: 18.253))
        
        generatedTrip.eventList.append(events2)
        
        let events3 = Event(title: "Dogs Bullocks", eventDescription: "Grab a burger", tag: "Dining", startTime: "14:00", endTime: "15:30", coordinate: CLLocationCoordinate2D(latitude: -34.444, longitude: 18.4))

        generatedTrip.eventList.append(events3)
        
        let events4 = Event(title: "Ocean Basket", eventDescription: "Shopp at the V&A waterfront", tag: "Shopping", startTime: "15:30", endTime: "19:00", coordinate: CLLocationCoordinate2D(latitude: -34.0014, longitude: 18.325))

        generatedTrip.eventList.append(events4)
        
        let events5 = Event(title: "Fork", eventDescription: "Tapas", tag: "Dining", startTime: "18:00", endTime: "21:00", coordinate: CLLocationCoordinate2D(latitude: -33.25, longitude: 18.2016))

        generatedTrip.eventList.append(events5)

        return generatedTrip
    }
    
}
