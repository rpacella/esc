//
//  TripController.swift
//  esc
//
//  Created by Larissa Clopton on 7/20/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit

class TripController {
    
    static var sharedInstance = TripEntryController()
    var currentTrips = [Trip]()
    
    private init(){
        
        let manager = NSFileManager.defaultManager()
        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        do {
            let availableTrips = try manager.contentsOfDirectoryAtURL(documents, includingPropertiesForKeys: nil, options: [])
            for aTrip in availableTrips {
                if let trip = NSKeyedUnarchiver.unarchiveObjectWithFile(file.path!) as? Trip {
                    currentTrips.append(trip)
                }
            }
            
        }
        catch {
            // do nothing
        }
    }
    
}
