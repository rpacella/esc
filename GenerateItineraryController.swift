//
//  GenerateItineraryController.swift
//  esc
//
//  Created by Larissa Clopton on 7/20/16.
//  Copyright © 2016 Escape. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GenerateItineraryController : WebService {
    
    static var sharedInstance = GenerateItineraryController()
    
    func generateItinerary(subtypes: [String], long: String, lat: String) {
        
        // make post request with these fields and the location
        let request = Alamofire.request(.POST, "https://ec2-52-33-4-120.us-west-2.compute.amazonaws.com:8000/hello", parameters: [
            "subtypes": subtypes,
            "long": long,
            "lat": lat
            ], encoding: .URL)
        
        request.responseJSON { data in
            print(data)
        }
        
//        executeRequest(request, requestCompletionFunction: {(responseCode, json) in
//            
//            if (responseCode/100 == 2)   {
//                
//                print(json)
//                
//                //
//                
//                /*var eventList = [Event]()
//                 
//                 for event in json.arrayValue {
//                 
//                 let newEvent = Event()
//                 //newEvent.image
//                 //newEvent.title
//                 //newEvent.location
//                 //newEvent.description
//                 //newEvent.tags
//                 //newEvent.starttime
//                 //newEvent.endtime
//                 
//                 eventList.append(newEvent)
//                 
//                 }
//                 
//                 onCompletion(list,nil)*/
//            }
//            /*else {
//             //the web service to create a user failed. Lets extract the error message to be displayed
//             let errorMessage = json["errors"]["full_messages"][0].stringValue
//             print(errorMessage)
//             //execute the closure in the ViewController
//             onCompletion(nil,errorMessage)
//             }*/
//        })
        
    }
}
