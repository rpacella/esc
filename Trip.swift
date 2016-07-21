//
//  Trip.swift
//  esc
//
//  Created by Larissa Clopton on 7/20/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit
import MapKit

class Trip: NSObject {
    
    var eventList:[Event] = []
    
    var ID: NSUUID
    
    override init() {
        
        self.ID = NSUUID()
    }
    
    
//    func returnURL() -> NSURL {
//        let manager = NSFileManager.defaultManager()
//        let documents = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) [0]
//        let fileURL: NSURL = documents.URLByAppendingPathComponent("file.txt") //<--- this is a url
//        return fileURL
//    }
//    
//    func getEvents() -> [Event] {
//        if let event =
//            NSKeyedUnarchiver.unarchiveObjectWithFile(returnURL().path!) as? [Event] {
//            eventList = event
//        }
//        return eventList
//    }
    
    required init?(coder: NSCoder) {
        
        eventList = (coder.decodeObjectForKey("eventList") as? [Event]) ?? [Event]()
        ID = (coder.decodeObjectForKey("ID") as? NSUUID) ?? NSUUID()
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(eventList, forKey: "eventList")
        
        aCoder.encodeObject(ID, forKey: "ID")
	}
 }
