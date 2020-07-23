//
//  ApiHandler.swift
//  App Using Linked List
//
//  Created by Nitin on 10/01/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import Foundation
import Alamofire

class ApiHandler{
    static let shared = ApiHandler()
    
    private init(){}
    
    func sendGetRequest(url : String, completionHandler: @escaping (_ response : [[String : AnyObject]],_ error:Error?) -> Void)  {
        
        
        
        Alamofire.request(url,method:.get,encoding:URLEncoding.httpBody)
            .responseJSON(completionHandler: { response in
                
                //
                //                debugPrint(response)
                //
                if((response.result.value) != nil) {
                    
                    
                    
                    // 2. now pass your variable / result to completion handler
                    completionHandler((response.result.value as? [[String:AnyObject]])!,nil)
                    
                    
                } else {
                    completionHandler([[:]],response.error)
                }
            })
        
        
    }
}
