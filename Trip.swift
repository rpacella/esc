//
//  Trip.swift
//  esc
//
//  Created by Larissa Clopton on 7/20/16.
//  Copyright © 2016 Escape. All rights reserved.
//

//import UIKit
//
//class Trip: NSCoding {
//    
//    var eventList: [Event]
//    var ID: NSUUID
//    
//    init(eventList: [Event]) {
//        
//        self.evenList = eventList
//        self.ID = NSUUID()
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        
//        eventList = (coder.decodeObjectForKey("eventList") as? Event) ?? Event()
//        
//        ID = (coder.decodeObjectForKey("ID") as? NSUUID) ?? NSUUID()
//        
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder) {
//        
//        aCoder.encodeObject(evenList, forKey: "eventList")
//        
//        aCoder.encodeObject(ID, forKey: "ID")
//        
//    }
//
//    
//}
