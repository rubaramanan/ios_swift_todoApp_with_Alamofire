//
//  NetworkClient.swift
//  catwalk
//
//  Created by Wins Thevaa on 4/2/19.
//  Copyright © 2019 Kryptonite. All rights reserved.
//

//import Foundation
//import Alamofire
////
//class NetworkClient {
//   //typealias  webserve = (([[String:Any]]?), Error?) -> Void
//
//    func valid(_url: URL,parameter:Parameters){
//    
//    Alamofire.request(URL, method:.post, parameters: parameter,
//                      encoding: JSONEncoding.default)
//        .responseJSON { response in
//            guard response.result.error == nil else {
//                // got an error in getting the data, need to handle it
//                print("error calling POST on /todos/1")
//                print(response.result.error!)
//                self.alertView(message: "\(response.result.error! as! String)")
//                return
//            }
//            // make sure we got some JSON since that's what we expect
//            guard let json = response.result.value as? [String: Any] else {
//                print("didn't get todo object as JSON from API")
//                //  print("Error: \(response.result.error)")
//                self.alertView(message: "\(response.result.error! as! String)")
//
//                return
//            }
//            print(json)
//            //get and print the title
//            //                             guard let todoTitle = json["name"] as? String else {
//            //                                   print("Could not get todo title from JSON")
//            //                                  return
//            //                            }
//            //                           print("name: " + todoTitle)
//    }
//
//    }
//}
