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
        
        let event1 = Event(title: "Jarryds", eventDescription: "Cafe", tag: "Dining", startTime: "10:00", endTime: "11:00", coordinate: CLLocationCoordinate2D(latitude: -33.92145, longitude: 18.38201))
        
        newTrip.eventList.append(event1)
        
        let event2 = Event(title: "Platteklip Gorge", eventDescription: "Hike on Table Mountain", tag: "Outdoors", startTime: "11:00", endTime: "14:00", coordinate: CLLocationCoordinate2D(latitude: -33.959434, longitude: 18.412885))
        
        newTrip.eventList.append(event2)
        
        let event3 = Event(title: "Greenhouse", eventDescription: "Deli", tag: "Dining", startTime: "14:00", endTime: "15:30", coordinate: CLLocationCoordinate2D(latitude: -34.002123, longitude: 18.434775))
        
        newTrip.eventList.append(event3)
        
        let event4 = Event(title: "The Piano Bar", eventDescription: "Jazz and music bar", tag: "Nightlife", startTime: "15:30", endTime: "19:00", coordinate: CLLocationCoordinate2D(latitude: -33.915530, longitude: 18.4171))
        
        newTrip.eventList.append(event4)
        
        let event5 = Event(title: "Rocomamas", eventDescription: "Grab a burger", tag: "Dining", startTime: "19:00", endTime: "21:00", coordinate: CLLocationCoordinate2D(latitude: -33.907731, longitude: 18.409117))
        
        newTrip.eventList.append(event5)
        
        return newTrip
     
        
    }
    
    func returnTripTwo() -> Trip {
        
        let generatedTrip = Trip()
        
        let events1 = Event(title: "Bacon on Bree", eventDescription: "If it's bacon you want then it's bacon you'll get.", tag: "Dining", startTime: "10:00", endTime: "11:00", coordinate: CLLocationCoordinate2D(latitude: -33.92558, longitude: 18.41358))
        
        generatedTrip.eventList.append(events1)
        
        let events2 = Event(title: "Bo-Kaap", eventDescription: "Colorful buildings of Cape Town", tag: "Sightsee", startTime: "11:30", endTime: "14:00", coordinate: CLLocationCoordinate2D(latitude: -33.921492, longitude: 18.415023))
        
        generatedTrip.eventList.append(events2)
        
        let events3 = Event(title: "Dogs Bullocks", eventDescription: "Grab a burger", tag: "Dining", startTime: "14:00", endTime: "15:30", coordinate: CLLocationCoordinate2D(latitude: -33.932390, longitude: 18.419147))

        generatedTrip.eventList.append(events3)
        
        let events4 = Event(title: "Ocean Basket", eventDescription: "Shop at the V&A waterfront", tag: "Shopping", startTime: "15:30", endTime: "19:00", coordinate: CLLocationCoordinate2D(latitude: -33.907004, longitude: 18.422597))

        generatedTrip.eventList.append(events4)
        
        let events5 = Event(title: "Fork", eventDescription: "Tapas", tag: "Dining", startTime: "18:00", endTime: "21:00", coordinate: CLLocationCoordinate2D(latitude: -33.92190, longitude: 18.4192))

        generatedTrip.eventList.append(events5)

        return generatedTrip
    }
    
}
